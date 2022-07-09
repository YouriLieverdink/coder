import 'package:coder/coder.dart';
import 'package:test/test.dart';

import '../../utilities/utilities.dart';

void main() {
  const context = Context();
  const emitter = FieldEmitter(context);

  group(
    'FieldEmitter',
    () {
      test(
        'should emit a field',
        () {
          const element = Field(
            name: 'state',
          );

          cExpect(
            element,
            cEquals(
              '''
                dynamic state;
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a field with a type',
        () {
          const element = Field(
            name: 'state',
            type: TypeReference('CatState'),
          );

          cExpect(
            element,
            cEquals(
              '''
                CatState state;
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a final field',
        () {
          const element = Field(
            name: 'state',
            modifier: FieldModifier.final_,
          );

          cExpect(
            element,
            cEquals(
              '''
                final dynamic state;
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a const field',
        () {
          const element = Field(
            name: 'state',
            modifier: FieldModifier.const_,
          );

          cExpect(
            element,
            cEquals(
              '''
                const dynamic state;
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a static field',
        () {
          const element = Field(
            name: 'state',
            isStatic: true,
          );

          cExpect(
            element,
            cEquals(
              '''
                static dynamic state;
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a late field',
        () {
          const element = Field(
            name: 'state',
            isLate: true,
          );

          cExpect(
            element,
            cEquals(
              '''
                late dynamic state;
              ''',
              emitter: emitter,
            ),
          );
        },
      );
    },
  );
}
