import 'package:coder/coder.dart';
import 'package:test/test.dart';

import '../matchers/equals_code.dart';

void main() {
  group(
    'ConstructorEmitter',
    () {
      test(
        'should create a Constructor',
        () {
          const element = Class(
            name: 'Cat',
            constructors: [
              Constructor(),
            ],
          );

          expect(
            element,
            equalsCode(
              '''
                class Cat {
                  Cat() {
                  }
                }
              ''',
            ),
          );
        },
      );

      test(
        'should create a const Constructor when isConst is true',
        () {
          const element = Class(
            name: 'Cat',
            constructors: [
              Constructor(
                isConst: true,
              ),
            ],
          );

          expect(
            element,
            equalsCode(
              '''
                class Cat {
                  const Cat();
                }
              ''',
            ),
          );
        },
      );

      test(
        'should create a factory Constructor when isFactory is true',
        () {
          const element = Class(
            name: 'Cat',
            constructors: [
              Constructor(
                isFactory: true,
              ),
            ],
          );

          expect(
            element,
            equalsCode(
              '''
                class Cat {
                  factory Cat() {
                  }
                }
              ''',
            ),
          );
        },
      );

      test(
        'should create a named factory constructor',
        () {
          const element = Class(
            name: 'Cat',
            constructors: [
              Constructor(
                isFactory: true,
                name: 'from',
              ),
            ],
          );

          expect(
            element,
            equalsCode(
              '''
                class Cat {
                  factory Cat.from() {
                  }
                }
              ''',
            ),
          );
        },
      );
    },
  );
}
