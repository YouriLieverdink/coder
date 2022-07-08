import 'package:coder/coder.dart';
import 'package:test/test.dart';

void main() {
  group(
    'EnumEmitter',
    () {
      test(
        'should create an Enum',
        () {
          const element = Enum(
            name: 'Status',
            values: [
              EnumValue('todo'),
              EnumValue('inProgress'),
              EnumValue('done'),
            ],
          );

          final result = EnumEmitter() //
              .emit(element)
              .toString();

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

  group(
    'EnumValueEmitter',
    () {
      test(
        'should create an enum value',
        () {
          const element = EnumValue('todo');

          final result = EnumValueEmitter() //
              .emit(element)
              .toString();

          expect(
            result,
            equals('todo'),
          );
        },
      );
    },
  );
}
