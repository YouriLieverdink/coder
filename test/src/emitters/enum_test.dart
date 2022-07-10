import 'package:coder/coder.dart';
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
        'should emit an enum with values and a trailling comma',
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
                  purr,
                }
              ''',
              emitter: EnumEmitter(
                Context(useTraillingCommas: true),
              ),
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
    },
  );
}
