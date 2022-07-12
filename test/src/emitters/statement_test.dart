import 'package:orchestrator/orchestrator.dart';
import 'package:test/test.dart';

import '../../utilities/utilities.dart';

void main() {
  const context = Context();

  group(
    'StatementEmitter',
    () {
      const emitter = StatementEmitter(context);

      test(
        'should emit a equal to statement',
        () {
          const left = Literal('cat');
          const right = Literal('dog');

          final statement = left.equalTo(right);

          Expect(
            statement,
            const Equals(
              '''
                'cat' == 'dog'
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a not equal to statement',
        () {
          const left = Literal('cat');
          const right = Literal('dog');

          final statement = left.notEqualTo(right);

          Expect(
            statement,
            const Equals(
              '''
                'cat' != 'dog'
              ''',
              emitter: emitter,
            ),
          );
        },
      );
    },
  );

  group(
    'BinaryEmitter',
    () {
      const emitter = BinaryEmitter(context);

      test(
        'should emit a binary statement',
        () {
          const statement = Binary(
            left: Literal('cat'),
            right: Literal('dog'),
            operator: '!=',
          );

          Expect(
            statement,
            const Equals(
              '''
                'cat' != 'dog'
              ''',
              emitter: emitter,
            ),
          );
        },
      );
    },
  );

  group(
    'LiteralEmitter',
    () {
      const emitter = LiteralEmitter(context);

      test(
        'should emit a literal bool statement',
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
        'should emit a literal null statement',
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
        'should emit a literal num statement',
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
        'should emit a literal string statement',
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

  group(
    'StaticEmitter',
    () {
      const emitter = StaticEmitter(context);

      test(
        'should emit a static statement',
        () {
          const statement = Static('print("Hello, world");');

          Expect(
            statement,
            const Equals(
              '''
              print("Hello, world");
              ''',
              emitter: emitter,
            ),
          );
        },
      );
    },
  );
}
