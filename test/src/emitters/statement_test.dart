import 'package:coder/coder.dart';
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
          const left = LiteralStatement('cat');
          const right = LiteralStatement('dog');

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
          const left = LiteralStatement('cat');
          const right = LiteralStatement('dog');

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
    'BinaryStatementEmitter',
    () {
      const emitter = BinaryStatementEmitter(context);

      test(
        'should emit a binary statement',
        () {
          const statement = BinaryStatement(
            left: LiteralStatement('cat'),
            right: LiteralStatement('dog'),
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
    'LiteralStatementEmitter',
    () {
      const emitter = LiteralStatementEmitter(context);

      test(
        'should emit a literal bool statement',
        () {
          const statement = LiteralStatement(true);

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
          const statement = LiteralStatement(null);

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
          const statement = LiteralStatement(42);

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
          const statement = LiteralStatement('cat');

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
    'StaticStatementEmitter',
    () {
      const emitter = StaticStatementEmitter(context);

      test(
        'should emit a static statement',
        () {
          const statement = StaticStatement('print("Hello, world");');

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
