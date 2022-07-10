import 'package:coder/coder.dart';
import 'package:test/test.dart';

import '../../utilities/utilities.dart';

void main() {
  const context = Context();
  const emitter = StatementEmitter(context);

  group(
    'StatementEmitter',
    () {
      test(
        'should emit a statement',
        () {
          const element = StaticStatement('print("Hello, world");');

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
