import 'package:coder/coder.dart';
import 'package:test/test.dart';

import '../../utilities/utilities.dart';

void main() {
  const context = Context();
  const emitter = ParameterEmitter(context);

  group(
    'ParameterEmitter',
    () {
      test(
        'should create a parameter',
        () {
          const element = Parameter(
            name: 'name',
          );

          cExpect(
            element,
            cEquals(
              '''
                dynamic name 
              ''',
              emitter: emitter,
            ),
          );
        },
      );
    },
  );
}
