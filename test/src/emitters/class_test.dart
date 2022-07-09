import 'package:coder/coder.dart';
import 'package:test/test.dart';

import '../../utilities/utilities.dart';

void main() {
  const context = Context();
  const emitter = ClassEmitter(context);

  group(
    'ClassEmitter',
    () {
      test(
        'should create a Class',
        () {
          const element = Class(
            name: 'Animal',
          );

          cExpect(
            element,
            cEquals(
              '''
                class Animal {
                }
              ''',
              emitter: emitter,
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

          cExpect(
            element,
            cEquals(
              '''
                class Cat extends Animal {
                }
              ''',
              emitter: emitter,
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

          cExpect(
            element,
            cEquals(
              '''
                class Cat {
                  String name;
                  int age;
                }
              ''',
              emitter: emitter,
            ),
          );
        },
      );
    },
  );
}
