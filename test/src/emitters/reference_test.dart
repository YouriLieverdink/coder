import 'package:coder/coder.dart';
import 'package:test/test.dart';

import '../../matchers/equals_code.dart';

void main() {
  group(
    'TypeReferenceEmitter',
    () {
      test(
        'should create a TypeReference',
        () {
          const element = TypeReference('String');

          expect(
            element,
            const EqualsCode(
              '''
                String
              ''',
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

          expect(
            element,
            const EqualsCode(
              '''
                List<String>
              ''',
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

          expect(
            element,
            const EqualsCode(
              '''
                Map<String,dynamic>
              ''',
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

          expect(
            element,
            const EqualsCode(
              '''
                String?
              ''',
            ),
          );
        },
      );
    },
  );

  group(
    'FunctionReferenceEmitter',
    () {
      test(
        'should create a FunctionReference',
        () {
          const element = FunctionReference(
            returns: TypeReference('String'),
          );

          expect(
            element,
            const EqualsCode(
              '''
                String Function()
              ''',
            ),
          );
        },
      );
    },
  );
}
