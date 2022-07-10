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

          Expect(
            element,
            const Equals(
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

          Expect(
            element,
            const Equals(
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

          Expect(
            element,
            const Equals(
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

          Expect(
            element,
            const Equals(
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

          Expect(
            element,
            const Equals(
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
    () {
      const emitter = ParameterListEmitter(context);

      test(
        'shoud emit a list of parameters',
        () {
          const elements = [
            Parameter(name: 'name'),
            Parameter(name: 'state'),
          ];

          Expect(
            elements,
            const Equals(
              '''
                dynamic name, dynamic state
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a list of named parameters',
        () {
          const elements = [
            Parameter(
              name: 'name',
              isNamed: true,
            ),
            Parameter(
              name: 'state',
              isNamed: true,
            ),
          ];

          Expect(
            elements,
            const Equals(
              '''
                {dynamic name, dynamic state}
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a list of optional parameters',
        () {
          const elements = [
            Parameter(
              name: 'name',
              isOptional: true,
            ),
            Parameter(
              name: 'state',
              isOptional: true,
            ),
          ];

          Expect(
            elements,
            const Equals(
              '''
                [dynamic name, dynamic state]
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a list of combined parameters',
        () {
          const elements = [
            Parameter(
              name: 'name',
              type: TypeReference('String'),
            ),
            Parameter(
              name: 'state',
              type: TypeReference('CatState'),
              isNamed: true,
              isRequired: true,
            ),
            Parameter(
              name: 'birthday',
              type: TypeReference('DateTime', isNullable: true),
              isNamed: true,
            ),
          ];

          Expect(
            elements,
            const Equals(
              '''
                String name, {required CatState state, DateTime? birthday}
              ''',
              emitter: emitter,
            ),
          );
        },
      );
    },
  );
}
