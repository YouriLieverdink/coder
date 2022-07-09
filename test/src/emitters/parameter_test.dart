import 'package:coder/coder.dart';
import 'package:test/test.dart';

import '../../utilities/utilities.dart';

void main() {
  const context = Context();

  group(
    'ParameterEmitter',
    () {
      const emitter = ParameterEmitter(context);

      test(
        'should emit a parameter',
        () {
          const element = Parameter(
            name: 'state',
          );

          cExpect(
            element,
            cEquals(
              '''
                dynamic state 
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a parameter with a type',
        () {
          const element = Parameter(
            name: 'state',
            type: TypeReference('CatState'),
          );

          cExpect(
            element,
            cEquals(
              '''
                CatState state 
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a required parameter when named',
        () {
          const element = Parameter(
            name: 'state',
            type: TypeReference('CatState'),
            isRequired: true,
            isNamed: true,
          );

          cExpect(
            element,
            cEquals(
              '''
                required CatState state
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a normal parameter when not named',
        () {
          const element = Parameter(
            name: 'state',
            type: TypeReference('CatState'),
            isRequired: true,
          );

          cExpect(
            element,
            cEquals(
              '''
                CatState state
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a to this parameter',
        () {
          const element = Parameter(
            name: 'state',
            isToThis: true,
          );

          cExpect(
            element,
            cEquals(
              '''
                this.state
              ''',
              emitter: emitter,
            ),
          );
        },
      );
    },
  );

  group(
    'ParameterListEmitter',
    () {},
  );
}
