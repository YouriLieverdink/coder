import 'package:orchestrator/orchestrator.dart';
import 'package:test/test.dart';

import '../../utilities/utilities.dart';

void main() {
  final context = Context();
  final emitter = InvokeEmitter(context);

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
            Equals(
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
            Equals(
              '''
                ('Pip', age: 8)
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit an invocation without a trailling comma when only one '
        'element is present',
        () {
          final context = Context(useTraillingCommas: true);

          const element = Invoke([
            LiteralString('Pip'),
          ]);

          Expect(
            element,
            Equals(
              '''
                ('Pip')
              ''',
              emitter: InvokeEmitter(context),
            ),
          );
        },
      );

      test(
        'should emit an invocation with a trailling comma when multiple '
        'elements are present',
        () {
          final context = Context(useTraillingCommas: true);

          const element = Invoke([
            LiteralString('Pip'),
            LiteralNum(8),
          ]);

          Expect(
            element,
            Equals(
              '''
                ('Pip', 8, )
              ''',
              emitter: InvokeEmitter(context),
            ),
          );
        },
      );
    },
  );
}
