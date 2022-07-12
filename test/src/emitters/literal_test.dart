import 'package:orchestrator/orchestrator.dart';
import 'package:test/test.dart';

import '../../utilities/utilities.dart';

void main() {
  const context = Context();
  const emitter = LiteralEmitter(context);

  group(
    'LiteralEmitter',
    () {
      test(
        'should emit a literal bool',
        () {
          const statement = Literal(true);

          Expect(
            statement,
            const Equals(
              '''
                true
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a literal null',
        () {
          const statement = Literal(null);

          Expect(
            statement,
            const Equals(
              '''
                null
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a literal num',
        () {
          const statement = Literal(42);

          Expect(
            statement,
            const Equals(
              '''
                42
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a literal string',
        () {
          const statement = Literal('cat');

          Expect(
            statement,
            const Equals(
              '''
                'cat'
              ''',
              emitter: emitter,
            ),
          );
        },
      );
    },
  );
}
