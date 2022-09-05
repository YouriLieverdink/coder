import 'package:orchestrator/orchestrator.dart';
import 'package:test/test.dart';

import '../../utilities/utilities.dart';

void main() {
  final context = Context();
  final emitter = StaticEmitter(context);

  group(
    'StaticEmitter',
    () {
      test(
        'should emit a static',
        () {
          const element = Static('print("Hello, world");');

          Expect(
            element,
            Equals(
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
