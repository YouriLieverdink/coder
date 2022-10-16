import 'package:orchestrator/orchestrator.dart';
import 'package:test/test.dart';

import '../../utilities/utilities.dart';

void main() {
  const context = Context();

  group(
    'TypeReferenceEmitter',
    () {
      const emitter = TypeReferenceEmitter(context);

      test(
        'should emit a type reference',
        () {
          const element = TypeReference('String');

          Expect(
            element,
            const Equals(
              '''
                String
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a type reference with a type parameter',
        () {
          const element = TypeReference(
            'List',
            types: [
              TypeReference('String'),
            ],
          );

          Expect(
            element,
            const Equals(
              '''
                List<String>
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a type reference with multiple type parameters',
        () {
          const element = TypeReference(
            'Map',
            types: [
              TypeReference('String'),
              TypeReference('dynamic'),
            ],
          );

          Expect(
            element,
            const Equals(
              '''
                Map<String,dynamic>
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a type reference with multiple equal type parameters',
        () {
          const element = TypeReference(
            'Map',
            types: [
              TypeReference('String'),
              TypeReference('String'),
            ],
          );

          Expect(
            element,
            const Equals(
              '''
                Map<String,String>
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a nullable type reference',
        () {
          const element = TypeReference(
            'String',
            isNullable: true,
          );

          Expect(
            element,
            const Equals(
              '''
                String?
              ''',
              emitter: emitter,
            ),
          );
        },
      );
    },
  );

  group(
    'FunctionReferenceEmitter',
    () {
      const emitter = FunctionReferenceEmitter(context);

      test(
        'should emit a function reference',
        () {
          const element = FunctionReference(
            returns: TypeReference('String'),
          );

          Expect(
            element,
            const Equals(
              '''
                String Function()
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a function reference with parameters',
        () {
          const element = FunctionReference(
            parameters: [
              Parameter(
                name: 'state',
                type: TypeReference('CatState'),
              ),
            ],
          );

          Expect(
            element,
            const Equals(
              '''
                void Function(CatState state)
              ''',
              emitter: emitter,
            ),
          );
        },
      );
    },
  );
}
