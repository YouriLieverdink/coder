import 'package:orchestrator/orchestrator.dart';
import 'package:test/test.dart';

import '../../utilities/utilities.dart';

void main() {
  const context = Context();
  const emitter = RowEmitter(context);

  group(
    'RowEmitter',
    () {
      test(
        'should emit a row of elements',
        () {
          const element = Row([
            Static('final '),
            Static('cat'),
            Static(' = '),
            Static('Cat()'),
          ]);

          Expect(
            element,
            const Equals(
              '''
                final cat = Cat()
              ''',
              emitter: emitter,
            ),
          );
        },
      );
    },
  );
}
