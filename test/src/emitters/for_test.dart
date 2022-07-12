import 'package:orchestrator/orchestrator.dart';
import 'package:test/test.dart';

import '../../utilities/utilities.dart';

void main() {
  const context = Context();
  const emitter = ForEmitter(context);

  group(
    'ForEmitter',
    () {
      test(
        'should emit a for',
        () {
          const element = For(
            condition: Static('int i = 0; i < 10; i++'),
            body: Block(
              elements: [
                Static('print(i);'),
              ],
            ),
          );

          Expect(
            element,
            const Equals(
              '''
                for (int i = 0; i < 10; i++) {
                  print(i);
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
