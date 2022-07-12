import 'package:orchestrator/orchestrator.dart';
import 'package:test/test.dart';

import '../../utilities/utilities.dart';

void main() {
  const context = Context();
  const emitter = IfEmitter(context);

  group(
    'IfEmitter',
    () {
      test(
        'should emit an if element',
        () {
          const element = If(
            condition: Static('i > 42'),
            then: [
              Static("print('Found the meaning of life!');"),
            ],
          );

          Expect(
            element,
            const Equals(
              '''
                if (i > 42) {
                  print('Found the meaning of life!');
                }
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit an if element with an else block',
        () {
          const statement = If(
            condition: Static('i > 42'),
            then: [
              Static("print('Found the meaning of life!');"),
            ],
            else_: [
              Static("print('Not yet!');"),
            ],
          );

          Expect(
            statement,
            const Equals(
              '''
                if (i > 42) {
                  print('Found the meaning of life!');
                } else {
                  print('Not yet!');
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
