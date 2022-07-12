import 'package:orchestrator/orchestrator.dart';
import 'package:test/test.dart';

import '../../utilities/utilities.dart';

void main() {
  const context = Context();
  const emitter = ColumnEmitter(context);

  group(
    'ColumnEmitter',
    () {
      test(
        'should emit a block of elements',
        () {
          const element = Column([
            Static('// Hello, my name is Pip!'),
            Static('final cat = Cat(name: "Pip");'),
          ]);

          Expect(
            element,
            const Equals(
              '''
                // Hello, my name is Pip!
                final cat = Cat(name: "Pip");
              ''',
              emitter: emitter,
            ),
          );
        },
      );
    },
  );
}
