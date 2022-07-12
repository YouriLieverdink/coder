import 'package:orchestrator/orchestrator.dart';
import 'package:test/test.dart';

import '../../utilities/utilities.dart';

void main() {
  const context = Context();
  const emitter = IfElseEmitter(context);

  group(
    'IfElseEmitter',
    () {
      test(
        'should emit an if',
        () {
          const element = IfElse(
            condition: Static('i > 42'),
            then: Block(
              elements: [
                Static("print('Found the meaning of life!');"),
              ],
            ),
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
          const statement = IfElse(
            condition: Static('i > 42'),
            then: Block(
              elements: [
                Static("print('Found the meaning of life!');"),
              ],
            ),
            else_: Block(
              elements: [
                Static("print('Not yet!');"),
              ],
            ),
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
