import 'package:orchestrator/orchestrator.dart';
import 'package:test/test.dart';

import '../../utilities/utilities.dart';

void main() {
  const context = Context();
  const emitter = InvokeEmitter(context);

  group(
    'InvokeEmitter',
    () {
      test(
        'should emit an invocation',
        () {
          const element = Invoke([
            LiteralString('Hello, world!'),
          ]);

          Expect(
            element,
            const Equals(
              '''
                ('Hello, world!')
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit an invocation with multiple arguments',
        () {
          final element = Invoke([
            const LiteralString('Pip'),
            const LiteralNum(8).named('age'),
          ]);

          Expect(
            element,
            const Equals(
              '''
                ('Pip', age: 8)
              ''',
              emitter: emitter,
            ),
          );
        },
      );
    },
  );
}
