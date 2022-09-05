import 'package:orchestrator/orchestrator.dart';
import 'package:test/test.dart';

import '../../utilities/utilities.dart';

void main() {
  final context = Context();
  final emitter = LoopEmitter(context);

  group(
    'LoopEmitter',
    () {
      test(
        'should emit a for loop',
        () {
          final element = Loop(
            kind: LoopKind.for_,
            clause: const Row([
              Static('var i = 0; '),
              Static('i < 10; '),
              Static('i++'),
            ]),
            body: const Static('print') //
                .invoke([const Static('i')]) //
                .statement,
          );

          Expect(
            element,
            Equals(
              '''
                for (var i = 0; i < 10; i++) {
                  print(i);
                }
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a while loop',
        () {
          final element = Loop(
            kind: LoopKind.while_,
            clause: const Static('i < 10'),
            body: const Static('print') //
                .invoke([const Static('i')]) //
                .statement,
          );

          Expect(
            element,
            Equals(
              '''
                while (i < 10) {
                  print(i);
                }
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a do while loop',
        () {
          final element = Loop(
            kind: LoopKind.doWhile,
            clause: const Static('i < 10'),
            body: const Static('print') //
                .invoke([const Static('i')]) //
                .statement,
          );

          Expect(
            element,
            Equals(
              '''
                do {
                  print(i);
                } while (i < 10);
              ''',
              emitter: emitter,
            ),
          );
        },
      );
    },
  );
}
