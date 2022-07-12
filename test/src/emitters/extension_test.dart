import 'package:orchestrator/orchestrator.dart';
import 'package:test/test.dart';

import '../../utilities/utilities.dart';

void main() {
  const context = Context();
  const emitter = ExtensionEmitter(context);

  group(
    'ExtensionEmitter',
    () {
      test(
        'should emit an extension',
        () {
          const element = Extension(
            on: TypeReference('Cat'),
          );

          Expect(
            element,
            const Equals(
              '''
                extension on Cat {
                }
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit an extension with a name',
        () {
          const element = Extension(
            on: TypeReference('Cat'),
            name: 'CatExtension',
          );

          Expect(
            element,
            const Equals(
              '''
                extension CatExtension on Cat {
                } 
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit an extension with fields',
        () {
          const element = Extension(
            on: TypeReference('Cat'),
            fields: [
              Field(
                name: 'numberOfMeows',
                type: TypeReference('int'),
                assign: Static('0'),
              ),
            ],
          );

          Expect(
            element,
            const Equals(
              '''
                extension on Cat {
                  int numberOfMeows = 0;
                }
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit an extension with methods',
        () {
          const element = Extension(
            on: TypeReference('Cat'),
            methods: [
              Method(
                name: 'meow',
                body: [
                  Static('numberOfMeows++;'),
                ],
              ),
            ],
          );

          Expect(
            element,
            const Equals(
              '''
                extension on Cat {
                  void meow() {
                    numberOfMeows++;
                  }
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
