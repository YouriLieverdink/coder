import 'package:coder/coder.dart';
import 'package:test/test.dart';

void main() {
  group(
    'Field',
    () {
      test(
        'supports property equality',
        () {
          expect(
            const Field(name: 'status'),
            equals(const Field(name: 'status')),
          );
        },
      );
    },
  );
}
