import 'package:orchestrator/orchestrator.dart';
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
        'should emit an abstract class',
        () {
          const element = Class(
            name: 'Animal',
            isAbstract: true,
          );

          Expect(
            element,
            const Equals(
              '''
                abstract class Animal {
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
        'should emit a class which implements another class',
        () {
          const element = Class(
            name: 'Cat',
            implements: [
              TypeReference('CatBehaviour'),
            ],
          );

          Expect(
            element,
            const Equals(
              '''
                class Cat implements CatBehaviour {
                }
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a class which implements multiple classes',
        () {
          const element = Class(
            name: 'Cat',
            implements: [
              TypeReference('CatBehaviour'),
              TypeReference('CatSounds'),
            ],
          );

          Expect(
            element,
            const Equals(
              '''
                class Cat implements CatBehaviour, CatSounds {
                }
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a class with another class',
        () {
          const element = Class(
            name: 'Cat',
            with_: [
              TypeReference('Sleeping'),
            ],
          );

          Expect(
            element,
            const Equals(
              '''
                class Cat with Sleeping {
                }
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a class with multiple classes',
        () {
          const element = Class(
            name: 'Cat',
            with_: [
              TypeReference('Sleeping'),
              TypeReference('Purring'),
            ],
          );

          Expect(
            element,
            const Equals(
              '''
                class Cat with Sleeping, Purring {
                }
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a class which extends, with, and implements classes',
        () {
          const element = Class(
            name: 'Cat',
            extends_: TypeReference('Animal'),
            with_: [
              TypeReference('Sleeping'),
              TypeReference('Purring'),
            ],
            implements: [
              TypeReference('CatBehaviour'),
            ],
          );

          Expect(
            element,
            const Equals(
              '''
                class Cat extends Animal 
                  with Sleeping, Purring 
                  implements CatBehaviour {
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
