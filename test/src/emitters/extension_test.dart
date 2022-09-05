import 'package:orchestrator/orchestrator.dart';
import 'package:test/test.dart';

import '../../utilities/utilities.dart';

void main() {
  final context = Context();
  final emitter = ExtensionEmitter(context);

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
            Equals(
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
            Equals(
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
            Equals(
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
            Equals(
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
            Equals(
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
            Equals(
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
            Equals(
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
