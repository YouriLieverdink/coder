import 'package:coder/coder.dart';
import 'package:test/test.dart';

void main() {
  group(
    'TypeReference',
    () {
      test(
        'supports property equality',
        () {
          expect(
            const TypeReference('Status'),
            equals(const TypeReference('Status')),
          );
        },
      );
    },
  );

  group(
    'FunctionReference',
    () {
      test(
        'supports property equality',
        () {
          expect(
            const FunctionReference(),
            equals(const FunctionReference()),
          );
        },
      );
    },
  );
}
