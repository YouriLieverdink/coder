import 'package:orchestrator/orchestrator.dart';
import 'package:test/test.dart';

import '../../utilities/utilities.dart';

void main() {
  const context = Context();
  const emitter = MixinEmitter(context);

  group(
    'MixinEmitter',
    () {
      test(
        'should emit a mixin',
        () {
          const element = Mixin(
            name: 'Walkable',
          );

          Expect(
            element,
            const Equals(
              '''
                mixin Walkable {
                }
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a mixin on a specific class',
        () {
          const element = Mixin(
            name: 'Walkable',
            on: TypeReference('Cat'),
          );

          Expect(
            element,
            const Equals(
              '''
                mixin Walkable on Cat {
                }
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a mixin with fields',
        () {
          const element = Mixin(
            name: 'Walkable',
            fields: [
              Field(
                name: 'legs',
                type: TypeReference('int'),
                assign: LiteralNum(4),
              ),
            ],
          );

          Expect(
            element,
            const Equals(
              '''
                mixin Walkable {
                  int legs = 4;
                }
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a mixin with methods',
        () {
          const element = Mixin(
            name: 'Walkable',
            methods: [
              Method(
                name: 'jump',
                returns: TypeReference('void'),
              ),
            ],
          );

          Expect(
            element,
            const Equals(
              '''
                mixin Walkable {
                  void jump() {
                  }
                }
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a mixin with spaced out elements',
        () {
          const element = Mixin(
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
                mixin Features on Cat {
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
        'should emit a mixin with docs',
        () {
          const element = Mixin(
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
                mixin Features on Cat {
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
