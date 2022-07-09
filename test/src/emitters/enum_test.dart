import 'package:coder/coder.dart';
import 'package:test/test.dart';

import '../../utilities/utilities.dart';

void main() {
  const context = Context();
  const emitter = EnumEmitter(context);

  group(
    'EnumEmitter',
    () {
      test(
        'should emit an enum',
        () {
          const element = Enum(
            name: 'Status',
            values: [
              EnumValue('todo'),
              EnumValue('inProgress'),
              EnumValue('done'),
            ],
          );

          cExpect(
            element,
            cEquals(
              '''
                enum Status {
                  todo,
                  inProgress,
                  done
                }
              ''',
              emitter: emitter,
            ),
          );
        },
      );
    },
  );
}
