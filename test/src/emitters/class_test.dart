import 'package:coder/coder.dart';
import 'package:test/test.dart';

import '../matchers/equals_code.dart';

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

          expect(
            element,
            const EqualsCode(
              '''
                class Animal {
                }
              ''',
            ),
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

          expect(
            element,
            const EqualsCode(
              '''
                class Cat extends Animal {
                }
              ''',
            ),
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

          expect(
            element,
            const EqualsCode(
              '''
                class Cat {
                  String name;
                  int age;
                }
              ''',
            ),
          );
        },
      );
    },
  );
}
