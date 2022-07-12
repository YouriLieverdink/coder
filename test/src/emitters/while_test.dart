import 'package:orchestrator/orchestrator.dart';
import 'package:test/test.dart';

import '../../utilities/utilities.dart';

void main() {
  const context = Context();
  const emitter = WhileEmitter(context);

  group(
    'WhileEmitter',
    () {
      test(
        'should emit a while element',
        () {
          const element = While(
            condition: Static('i < 42'),
            body: [
              Static('i++;'),
            ],
          );

          Expect(
            element,
            const Equals(
              '''
                while (i < 42) {
                  i++;
                }
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a do while element',
        () {
          const element = While(
            condition: Static('i < 42'),
            kind: WhileKind.doWhile,
            body: [
              Static('i++;'),
            ],
          );

          Expect(
            element,
            const Equals(
              '''
                do {
                  i++;
                } while (i < 42);
              ''',
              emitter: emitter,
            ),
          );
        },
      );
    },
  );
}
