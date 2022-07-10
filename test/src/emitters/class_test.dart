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

          Expect(
            element,
            const Equals(
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

          Expect(
            element,
            const Equals(
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

          Expect(
            element,
            const Equals(
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

          Expect(
            element,
            const Equals(
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
