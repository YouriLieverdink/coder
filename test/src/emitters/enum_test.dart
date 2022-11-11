import 'package:orchestrator/orchestrator.dart';
import 'package:test/test.dart';

import '../../utilities/utilities.dart';

void main() {
  const context = Context();

  group(
    'EnumEmitter',
    () {
      const emitter = EnumEmitter(context);

      test(
        'should emit an enum',
        () {
          const element = Enum(
            name: 'CatState',
          );

          Expect(
            element,
            const Equals(
              '''
                enum CatState {
                }
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit an enum with values',
        () {
          const element = Enum(
            name: 'CatState',
            values: [
              EnumValue('sleep'),
              EnumValue('eat'),
              EnumValue('purr'),
            ],
          );

          Expect(
            element,
            const Equals(
              '''
                enum CatState {
                  sleep,
                  eat,
                  purr
                }
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit an enum with docs',
        () {
          const element = Enum(
            name: 'CatState',
            values: [
              EnumValue('sleep'),
              EnumValue('eat'),
              EnumValue('purr'),
            ],
            docs: [
              Docs('What has the cat been doing?'),
            ],
          );

          Expect(
            element,
            const Equals(
              '''
                /// What has the cat been doing?
                enum CatState {
                  sleep,
                  eat,
                  purr
                }
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit an enum with annotations',
        () {
          const element = Enum(
            name: 'CatState',
            values: [
              EnumValue('sleep'),
              EnumValue('eat'),
              EnumValue('purr'),
            ],
            annotations: [
              Annotation(
                type: TypeReference('Roar'),
              ),
            ],
          );

          Expect(
            element,
            const Equals(
              '''
                @Roar
                enum CatState {
                  sleep,
                  eat,
                  purr
                }
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit an enum with a constructor',
        () {
          const element = Enum(
            name: 'CatState',
            values: [
              EnumValue('sleep'),
              EnumValue('eat'),
              EnumValue('purr'),
            ],
            constructors: [
              Constructor(
                isConst: true,
                parameters: [
                  Parameter(
                    name: 'duration',
                    isToThis: true,
                  ),
                ],
              ),
            ],
          );

          Expect(
            element,
            const Equals(
              '''
                enum CatState {
                  sleep,
                  eat,
                  purr;

                  const CatState(this.duration);
                }
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit an enum with fields',
        () {
          const element = Enum(
            name: 'CatState',
            values: [
              EnumValue('sleep'),
              EnumValue('eat'),
              EnumValue('purr'),
            ],
            constructors: [
              Constructor(
                parameters: [
                  Parameter(
                    name: 'duration',
                    isToThis: true,
                  ),
                ],
              ),
            ],
            fields: [
              Field(
                name: 'duration',
                modifier: FieldModifier.final_,
                type: TypeReference('int'),
              ),
            ],
          );

          Expect(
            element,
            const Equals(
              '''
                enum CatState {
                  sleep,
                  eat,
                  purr;

                  CatState(this.duration);
                  final int duration;
                }
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit an enum with methods',
        () {
          const element = Enum(
            name: 'CatState',
            values: [
              EnumValue('sleep'),
              EnumValue('eat'),
              EnumValue('purr'),
            ],
            constructors: [
              Constructor(
                parameters: [
                  Parameter(
                    name: 'duration',
                    isToThis: true,
                  ),
                ],
              ),
            ],
            methods: [
              Method(
                returns: TypeReference('void'),
                name: 'meow',
                body: Column([]),
              ),
            ],
          );

          Expect(
            element,
            const Equals(
              '''
                enum CatState {
                  sleep,
                  eat,
                  purr;

                  CatState(this.duration);
                  void meow() {}
                }
              ''',
              emitter: emitter,
            ),
          );
        },
      );
    },
  );

  group(
    'EnumValueEmitter',
    () {
      const emitter = EnumValueEmitter(context);

      test(
        'should emit an enum value',
        () {
          const element = EnumValue('sleep');

          Expect(
            element,
            const Equals(
              '''
                sleep
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit an enum value with docs',
        () {
          const element = EnumValue(
            'sleep',
            docs: [
              Docs('Only for tired people'),
            ],
          );

          Expect(
            element,
            const Equals(
              '''
                /// Only for tired people
                sleep
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit an enum value with annotations',
        () {
          const element = EnumValue(
            'sleep',
            annotations: [
              Annotation(
                type: TypeReference('Deprecated'),
              ),
            ],
          );

          Expect(
            element,
            const Equals(
              '''
                @Deprecated
                sleep
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit an enum value with arguments',
        () {
          final element = EnumValue(
            'sleep',
            arguments: [
              Literal.of(10).named('duration'),
            ],
          );

          Expect(
            element,
            const Equals(
              '''
                sleep(duration: 10)
              ''',
              emitter: emitter,
            ),
          );
        },
      );
    },
  );
}
