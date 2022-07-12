import 'package:orchestrator/orchestrator.dart';
import 'package:test/test.dart';

import '../utilities/utilities.dart';

void main() {
  const context = Context();
  const emitter = ElementEmitter(context);

  group(
    'Builder',
    () {
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
}
