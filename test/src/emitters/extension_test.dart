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
                returns: TypeReference('void'),
                body: Column([
                  Static('numberOfMeows++;'),
                ]),
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

      test(
        'should emit an extension with spaced out elements',
        () {
          const element = Extension(
            name: 'Features',
            on: TypeReference('Cat'),
            fields: [
              Field(
                name: 'age',
                modifier: FieldModifier.final_,
                type: TypeReference('int'),
              ),
            ],
            methods: [
              Method(
                name: 'meow',
                returns: TypeReference('void'),
                body: Column([
                  Static('print("meow!");'),
                ]),
              ),
            ],
          );

          Expect(
            element,
            const Equals(
              '''
                extension Features on Cat {
                  final int age;

                  void meow() {
                    print("meow!");
                  }
                }
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit an extension with docs',
        () {
          const element = Extension(
            name: 'Features',
            on: TypeReference('Cat'),
            docs: [
              Docs('Additional cat features'),
            ],
          );

          Expect(
            element,
            const Equals(
              '''
                /// Additional cat features
                extension Features on Cat {
                }
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit an extension with annotations',
        () {
          const element = Extension(
            name: 'Features',
            on: TypeReference('Cat'),
            annotations: [
              Annotation('Superb'),
            ],
          );

          Expect(
            element,
            const Equals(
              '''
                @Superb
                extension Features on Cat {
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
