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

          cExpect(
            element,
            cEquals(
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

          cExpect(
            element,
            cEquals(
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

          cExpect(
            element,
            cEquals(
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
