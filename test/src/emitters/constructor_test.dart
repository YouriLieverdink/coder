import 'package:coder/coder.dart';
import 'package:test/test.dart';

import '../../utilities/utilities.dart';

void main() {
  const context = Context();
  const class_ = Class(name: 'Animal');
  const emitter = ConstructorEmitter(context, class_);

  group(
    'ConstructorEmitter',
    () {
      test(
        'should create a constructor',
        () {
          const element = Constructor();

          cExpect(
            element,
            cEquals(
              '''
                Animal() {
                }
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should create a const constructor',
        () {
          const element = Constructor(
            isConst: true,
          );

          cExpect(
            element,
            cEquals(
              '''
                const Animal();
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should create a factory constructor',
        () {
          const element = Constructor(
            isFactory: true,
          );

          cExpect(
            element,
            cEquals(
              '''
                factory Animal() {
                }
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should create a named factory constructor',
        () {
          const element = Constructor(
            isFactory: true,
            name: 'fromCat',
          );

          cExpect(
            element,
            cEquals(
              '''
                factory Animal.fromCat() {
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
