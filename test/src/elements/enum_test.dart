import 'package:coder/coder.dart';
import 'package:test/test.dart';

void main() {
  group(
    'Enum',
    () {
      test(
        'supports property equality',
        () {
          expect(
            const Enum(name: 'Status'),
            equals(const Enum(name: 'Status')),
          );
        },
      );
    },
  );

  group(
    'EnumValue',
    () {
      test(
        'supports property equality',
        () {
          expect(
            const EnumValue('todo'),
            equals(const EnumValue('todo')),
          );
        },
      );
    },
  );
}
