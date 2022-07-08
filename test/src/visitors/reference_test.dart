import 'package:coder/coder.dart';
import 'package:test/test.dart';

void main() {
  group(
    'visitReference',
    () {
      test(
        'should create a Reference',
        () {
          const element = Reference(
            symbol: 'String',
          );

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
        'should create a Reference with a type parameter',
        () {
          const element = Reference(
            symbol: 'List',
            types: [
              Reference(symbol: 'String'),
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
        'should create a Reference with multiple type parameters',
        () {
          const element = Reference(
            symbol: 'Map',
            types: [
              Reference(symbol: 'String'),
              Reference(symbol: 'dynamic'),
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
        'should create a nullable reference',
        () {
          const element = Reference(
            symbol: 'String',
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
}
