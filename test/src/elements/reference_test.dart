import 'package:coder/coder.dart';
import 'package:test/test.dart';

void main() {
  group(
    'Reference',
    () {
      test(
        'supports property equality',
        () {
          expect(
            const Reference(symbol: 'Status'),
            equals(const Reference(symbol: 'Status')),
          );
        },
      );
    },
  );
}
