import 'package:coder/coder.dart';
import 'package:test/test.dart';

void main() {
  group(
    'Class',
    () {
      test(
        'supports property equality',
        () {
          expect(
            const Class(name: 'Animal'),
            equals(const Class(name: 'Animal')),
          );
        },
      );
    },
  );
}
