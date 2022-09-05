import 'package:orchestrator/orchestrator.dart';
import 'package:test/test.dart';

import '../../utilities/utilities.dart';

void main() {
  const class_ = Class(name: 'Cat');

  final context = Context();
  final emitter = ConstructorEmitter(context, class_);

  group(
    'ConstructorEmitter',
    () {
      test(
        'should emit a constructor',
        () {
          const element = Constructor();

          Expect(
            element,
            Equals(
              '''
                Cat();
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a const constructor',
        () {
          const element = Constructor(
            isConst: true,
          );

          Expect(
            element,
            Equals(
              '''
                const Cat();
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a factory constructor',
        () {
          const element = Constructor(
            isFactory: true,
          );

          Expect(
            element,
            Equals(
              '''
                factory Cat();
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a named constructor',
        () {
          const element = Constructor(
            name: 'fromJson',
          );

          Expect(
            element,
            Equals(
              '''
                Cat.fromJson();
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a constructor with parameters',
        () {
          const element = Constructor(
            parameters: [
              Parameter(
                name: 'name',
                type: TypeReference('String'),
              ),
            ],
          );

          Expect(
            element,
            Equals(
              '''
                Cat(String name);
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a constructor with a body',
        () {
          const element = Constructor(
            parameters: [
              Parameter(
                name: 'name',
                type: TypeReference('String'),
              ),
            ],
            body: Column([
              Static('this.name = name;'),
            ]),
          );

          Expect(
            element,
            Equals(
              '''
                Cat(String name) {
                  this.name = name;
                }
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a constructor with a semicolon when the body is empty',
        () {
          const element = Constructor(
            parameters: [
              Parameter(
                name: 'name',
                type: TypeReference('String'),
              ),
            ],
          );

          Expect(
            element,
            Equals(
              '''
                Cat(String name);
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a constructor with docs',
        () {
          const element = Constructor(
            docs: [
              Docs('Create a new Cat from scratch!'),
            ],
          );

          Expect(
            element,
            Equals(
              '''
                /// Create a new Cat from scratch!
                Cat();
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a constructor with one initializer when not constant',
        () {
          const element = Constructor(
            initializers: [
              Static("super('Pip')"),
            ],
          );

          Expect(
            element,
            Equals(
              '''
                Cat() : super('Pip');
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a constructor with one initializer when constant',
        () {
          const element = Constructor(
            isConst: true,
            initializers: [
              Static("super('Pip')"),
            ],
          );

          Expect(
            element,
            Equals(
              '''
                const Cat() : super('Pip');
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a constructor with multiple initializers',
        () {
          const element = Constructor(
            initializers: [
              Static("super('Pip')"),
              Static('livesLeft = 9'),
            ],
          );

          Expect(
            element,
            Equals(
              '''
                Cat() : super('Pip'), livesLeft = 9;
              ''',
              emitter: emitter,
            ),
          );
        },
      );
    },
  );
}
