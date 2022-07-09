import 'package:coder/coder.dart';
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

          cExpect(
            element,
            cEquals(
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

          cExpect(
            element,
            cEquals(
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

          cExpect(
            element,
            cEquals(
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

          cExpect(
            element,
            cEquals(
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

          cExpect(
            element,
            cEquals(
              '''
                Cat(String name) {
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
