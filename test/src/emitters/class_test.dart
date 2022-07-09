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
        'should emit a class',
        () {
          const element = Class(name: 'Cat');

          cExpect(
            element,
            cEquals(
              '''
                class Cat {
                }
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a class which extends another class',
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
        'should emit a class with constructors',
        () {
          const element = Class(
            name: 'Cat',
            constructors: [
              Constructor(),
            ],
          );

          cExpect(
            element,
            cEquals(
              '''
                class Cat {
                  Cat() {
                  }
                }
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a class with fields',
        () {
          const element = Class(
            name: 'Cat',
            fields: [
              Field(
                name: 'name',
                type: TypeReference('String'),
              ),
            ],
          );

          cExpect(
            element,
            cEquals(
              '''
                class Cat {
                  String name;
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
