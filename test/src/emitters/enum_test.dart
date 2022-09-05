import 'package:orchestrator/orchestrator.dart';
import 'package:test/test.dart';

import '../../utilities/utilities.dart';

void main() {
  final context = Context();

  group(
    'EnumEmitter',
    () {
      final emitter = EnumEmitter(context);

      test(
        'should emit an enum',
        () {
          const element = Enum(
            name: 'CatState',
          );

          Expect(
            element,
            Equals(
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
            Equals(
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
            Equals(
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
              Annotation('Roar'),
            ],
          );

          Expect(
            element,
            Equals(
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
    },
  );

  group(
    'EnumValueEmitter',
    () {
      final emitter = EnumValueEmitter(context);

      test(
        'should emit an enum value',
        () {
          const element = EnumValue('sleep');

          Expect(
            element,
            Equals(
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
            Equals(
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
              Annotation('Deprecated'),
            ],
          );

          Expect(
            element,
            Equals(
              '''
                @Deprecated
                sleep
              ''',
              emitter: emitter,
            ),
          );
        },
      );
    },
  );
}
