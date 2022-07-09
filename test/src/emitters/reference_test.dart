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
        'should create a TypeReference',
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
        'should create a TypeReference with a type parameter',
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
        'should create a TypeReference with multiple type parameters',
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
        'should create a nullable TypeReference',
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
        'should create a FunctionReference',
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
    },
  );
}
