import 'package:coder/coder.dart';
import 'package:test/test.dart';

void main() {
  group(
    'visitEnum',
    () {
      test(
        'should create an Enum',
        () {
          const element = Enum(
            name: 'Status',
            values: [
              EnumValue(name: 'todo'),
              EnumValue(name: 'inProgress'),
              EnumValue(name: 'done'),
            ],
          );

          final result = visitEnum(element).toString();

          expect(
            result,
            equals(
              'enum Status {todo,inProgress,done}',
            ),
          );
        },
      );
    },
  );
}
