import 'package:coder/coder.dart';
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

          cExpect(
            element,
            cEquals(
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

          cExpect(
            element,
            cEquals(
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

          cExpect(
            element,
            cEquals(
              '''
                Map<String,dynamic>
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

          cExpect(
            element,
            cEquals(
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

          cExpect(
            element,
            cEquals(
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

          cExpect(
            element,
            cEquals(
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
