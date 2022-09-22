import 'package:orchestrator/orchestrator.dart';
import 'package:test/test.dart';

import '../../utilities/utilities.dart';

void main() {
  const context = Context();
  const emitter = AnnotationEmitter(context);

  group(
    'AnnotationEmitter',
    () {
      test(
        'should emit an annotation',
        () {
          const element = Annotation(
            type: TypeReference('override'),
          );

          Expect(
            element,
            const Equals(
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
            type: TypeReference('Deprecated'),
            arguments: [
              LiteralString('Use another method'),
            ],
          );

          Expect(
            element,
            const Equals(
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
