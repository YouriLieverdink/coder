import 'package:coder/coder.dart';
import 'package:test/test.dart';

void main() {
  group(
    'ClassEmitter',
    () {
      test(
        'should create a Class',
        () {
          const element = Class(
            name: 'Animal',
          );

          final result = ClassEmitter() //
              .emit(element)
              .toString();

          expect(
            result,
            equals('class Animal {}'),
          );
        },
      );

      test(
        'should create a Class which extends another Class',
        () {
          const element = Class(
            name: 'Cat',
            extends_: TypeReference('Animal'),
          );

          final result = ClassEmitter() //
              .emit(element)
              .toString();

          expect(
            result,
            equals('class Cat extends Animal {}'),
          );
        },
      );

      test(
        'should create a class with Fields',
        () {
          const element = Class(
            name: 'Cat',
            fields: [
              Field(
                name: 'name',
                type: TypeReference('String'),
              ),
              Field(
                name: 'age',
                type: TypeReference('int'),
              ),
            ],
          );

          final result = ClassEmitter() //
              .emit(element)
              .toString();

          expect(
            result,
            equals('class Cat {String name;int age;}'),
          );
        },
      );
    },
  );
}
