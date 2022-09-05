import 'package:orchestrator/orchestrator.dart';
import 'package:test/test.dart';

import '../../utilities/utilities.dart';

void main() {
  final context = Context();
  final emitter = AnnotationEmitter(context);

  group(
    'AnnotationEmitter',
    () {
      test(
        'should emit an annotation',
        () {
          const element = Annotation('override');

          Expect(
            element,
            Equals(
              '''
                @override
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit an annotation with arguments',
        () {
          const element = Annotation(
            'Deprecated',
            arguments: [
              LiteralString('Use another method'),
            ],
          );

          Expect(
            element,
            Equals(
              '''
                @Deprecated('Use another method')
              ''',
              emitter: emitter,
            ),
          );
        },
      );
    },
  );
}
