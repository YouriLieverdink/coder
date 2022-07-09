import 'package:coder/coder.dart';
import 'package:test/test.dart';

import '../../matchers/equals_code.dart';

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
            const EqualsCode(
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
            const EqualsCode(
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
            const EqualsCode(
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
            const EqualsCode(
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

      test(
        'should create a constructor with parameters',
        () {
          const element = Class(
            name: 'Cat',
            constructors: [
              Constructor(
                parameters: [
                  Parameter(
                    type: TypeReference('String'),
                    name: 'name',
                  ),
                  Parameter(
                    type: TypeReference('int'),
                    name: 'age',
                  ),
                ],
              ),
            ],
          );

          expect(
            element,
            const EqualsCode(
              '''
                class Cat {
                  Cat(String name, int age) {
                  }
                }
              ''',
            ),
          );
        },
      );

      test(
        'should create a constructor with named parameters',
        () {
          const element = Class(
            name: 'Cat',
            constructors: [
              Constructor(
                parameters: [
                  Parameter(
                    type: TypeReference('String'),
                    name: 'name',
                    isRequired: true,
                    isNamed: true,
                  ),
                  Parameter(
                    type: TypeReference('int', isNullable: true),
                    name: 'age',
                    isNamed: true,
                  ),
                ],
              ),
            ],
          );

          expect(
            element,
            const EqualsCode(
              '''
                class Cat {
                  Cat({required String name, int? age}) {
                  }
                }
              ''',
            ),
          );
        },
      );

      test(
        'should create a constructor with required and named parameters',
        () {
          const element = Class(
            name: 'Cat',
            constructors: [
              Constructor(
                parameters: [
                  Parameter(
                    type: TypeReference('String'),
                    name: 'name',
                  ),
                  Parameter(
                    type: TypeReference('int', isNullable: true),
                    name: 'age',
                    isNamed: true,
                  ),
                ],
              ),
            ],
          );

          expect(
            element,
            const EqualsCode(
              '''
                class Cat {
                  Cat(String name, {int? age}) {
                  }
                }
              ''',
            ),
          );
        },
      );

      test(
        'should create a constructor with required and optional parameters',
        () {
          const element = Class(
            name: 'Cat',
            constructors: [
              Constructor(
                parameters: [
                  Parameter(
                    type: TypeReference('String'),
                    name: 'name',
                  ),
                  Parameter(
                    type: TypeReference('int', isNullable: true),
                    name: 'age',
                    isOptional: true,
                  ),
                ],
              ),
            ],
          );

          expect(
            element,
            const EqualsCode(
              '''
                class Cat {
                  Cat(String name, [int? age]) {
                  }
                }
              ''',
            ),
          );
        },
      );

      test(
        'should create a constructor with initializing parameters',
        () {
          const element = Class(
            name: 'Cat',
            constructors: [
              Constructor(
                parameters: [
                  Parameter(
                    type: TypeReference('String'),
                    name: 'name',
                    isToThis: true,
                  ),
                  Parameter(
                    type: TypeReference('int', isNullable: true),
                    name: 'age',
                    isToThis: true,
                    isOptional: true,
                  ),
                ],
              ),
            ],
          );

          expect(
            element,
            const EqualsCode(
              '''
                class Cat {
                  Cat(this.name, [this.age]) {
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
