import 'package:coder/coder.dart';
import 'package:test/test.dart';

void main() {
  group(
    'visitTypeReference',
    () {
      test(
        'should create a TypeReference',
        () {
          const element = TypeReference('String');

          final result = element //
              .visit()
              .toString();

          expect(
            result,
            equals('String'),
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

          final result = element //
              .visit()
              .toString();

          expect(
            result,
            equals('List<String>'),
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

          final result = element //
              .visit()
              .toString();

          expect(
            result,
            equals('Map<String,dynamic>'),
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

          final result = element //
              .visit()
              .toString();

          expect(
            result,
            equals('String?'),
          );
        },
      );
    },
  );

  group(
    'FunctionReference',
    () {
      test(
        'should create a FunctionReference',
        () {
          const element = FunctionReference(
            returns: TypeReference('String'),
          );

          final result = element //
              .visit()
              .toString();

          expect(
            result,
            equals('String Function()'),
          );
        },
      );
    },
  );
}
