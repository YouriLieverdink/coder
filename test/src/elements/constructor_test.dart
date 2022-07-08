import 'package:coder/coder.dart';
import 'package:test/test.dart';

void main() {
  group(
    'Constructor',
    () {
      test(
        'supports property equality',
        () {
          expect(
            const Constructor(),
            equals(const Constructor()),
          );
        },
      );
    },
  );
}
