import 'package:orchestrator/orchestrator.dart';
import 'package:test/test.dart';

import '../../utilities/utilities.dart';

void main() {
  const context = Context();
  const emitter = BinaryEmitter(context);

  group(
    'BinaryEmitter',
    () {
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
}
