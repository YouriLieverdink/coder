import 'package:orchestrator/orchestrator.dart';
import 'package:test/test.dart';

import '../../utilities/utilities.dart';

void main() {
  final context = Context();
  final emitter = DocsEmitter(context);

  group(
    'DocsEmitter',
    () {
      test(
        'should emit a docs',
        () {
          const element = Docs('Hello!');

          Expect(
            element,
            Equals(
              '''
                /// Hello!
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a docs with wrapped lines at 80 characters',
        () {
          const element = Docs(
            'Hello, this is a piece of text which is much longer than 80 '
            'characters so we can see the wrapping of text in action.',
          );

          Expect(
            element,
            Equals(
              '''
                /// Hello, this is a piece of text which is much longer than 80 characters so we
                /// can see the wrapping of text in action.
              ''',
              emitter: emitter,
            ),
          );
        },
      );
    },
  );
}
