import 'package:coder/coder.dart';
import 'package:test/test.dart';

import '../matchers/equals_code.dart';

void main() {
  group(
    'EnumEmitter',
    () {
      test(
        'should create an Enum',
        () {
          const element = Enum(
            name: 'Status',
            values: [
              EnumValue('todo'),
              EnumValue('inProgress'),
              EnumValue('done'),
            ],
          );

          expect(
            element,
            const EqualsCode(
              '''
                enum Status {
                  todo,
                  inProgress,
                  done
                }
              ''',
            ),
          );
        },
      );
    },
  );
}
