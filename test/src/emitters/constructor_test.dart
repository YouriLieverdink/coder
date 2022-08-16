import 'package:orchestrator/orchestrator.dart';
import 'package:test/test.dart';

import '../../utilities/utilities.dart';

void main() {
  const context = Context();
  const class_ = Class(name: 'Cat');
  const emitter = ConstructorEmitter(context, class_);

  group(
    'ConstructorEmitter',
    () {
      test(
        'should emit a constructor',
        () {
          const element = Constructor();

          Expect(
            element,
            const Equals(
              '''
                Cat() {
                }
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
            const Equals(
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
            const Equals(
              '''
                factory Cat() {
                } 
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
            const Equals(
              '''
                Cat.fromJson() {
                }
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
            const Equals(
              '''
                Cat(String name) {
                }
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
            const Equals(
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
        'should emit a constructor with docs',
        () {
          const element = Constructor(
            docs: [
              Docs('Create a new Cat from scratch!'),
            ],
          );

          Expect(
            element,
            const Equals(
              '''
                /// Create a new Cat from scratch!
                Cat() {
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
