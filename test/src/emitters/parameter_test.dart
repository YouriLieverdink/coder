import 'package:coder/coder.dart';
import 'package:test/test.dart';

import '../../matchers/equals_code.dart';

void main() {
  group(
    'ParameterEmitter',
    () {
      test(
        'should create a parameter',
        () {
          const element = Parameter(
            name: 'name',
          );

          expect(
            element,
            const EqualsCode(
              '''
                dynamic name 
              ''',
            ),
          );
        },
      );
    },
  );
}
