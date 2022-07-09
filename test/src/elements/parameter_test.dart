import 'package:coder/coder.dart';
import 'package:test/test.dart';

void main() {
  group(
    'Parameter',
    () {
      test(
        'supports property equality',
        () {
          expect(
            const Parameter(name: 'status'),
            equals(const Parameter(name: 'status')),
          );
        },
      );
    },
  );
}
