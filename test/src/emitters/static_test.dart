import 'package:orchestrator/orchestrator.dart';
import 'package:test/test.dart';

import '../../utilities/utilities.dart';

void main() {
  const context = Context();
  const emitter = StaticEmitter(context);

  group(
    'StaticEmitter',
    () {
      test(
        'should emit a static',
        () {
          const element = Static('print("Hello, world");');

          Expect(
            element,
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
