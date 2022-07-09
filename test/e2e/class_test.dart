import 'package:coder/coder.dart';
import 'package:test/test.dart';

import '../matchers/equals_code.dart';

void main() {
  test(
    'should generate a complex class',
    () {
      const element = Class(
        name: 'Cat',
        extends_: TypeReference('Animal'),
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
        fields: [
          Field(
            type: TypeReference('String'),
            name: 'name',
          ),
          Field(
            type: TypeReference('int', isNullable: true),
            name: 'age',
          ),
        ],
      );

      expect(
        element,
        const EqualsCode(
          '''
            class Cat extends Animal {
              Cat(String name, {int? age}) {
              }
              String name;
              int? age;
            }
          ''',
        ),
      );
    },
  );
}
