import 'package:coder/coder.dart';
import 'package:test/test.dart';

import '../../utilities/utilities.dart';

void main() {
  const context = Context();
  const emitter = FieldEmitter(context);

  group('FieldEmitter', () {
    test(
      'should create a field',
      () {
        const element = Field(name: 'status');

        cExpect(
          element,
          cEquals(
            '''
              dynamic status;
            ''',
            emitter: emitter,
          ),
        );
      },
    );

    test(
      'should create a field with a type',
      () {
        const element = Field(
          name: 'status',
          type: TypeReference('Status'),
        );

        cExpect(
          element,
          cEquals(
            '''
              Status status;
            ''',
            emitter: emitter,
          ),
        );
      },
    );

    test(
      'should create a static field',
      () {
        const element = Field(
          name: 'status',
          isStatic: true,
        );

        cExpect(
          element,
          cEquals(
            '''
              static dynamic status;
            ''',
            emitter: emitter,
          ),
        );
      },
    );

    test(
      'should create a late field',
      () {
        const element = Field(
          name: 'status',
          isLate: true,
        );

        cExpect(
          element,
          cEquals(
            '''
              late dynamic status;
            ''',
            emitter: emitter,
          ),
        );
      },
    );

    test(
      'should create a const field',
      () {
        const element = Field(
          name: 'status',
          modifier: FieldModifier.const_,
        );

        cExpect(
          element,
          cEquals(
            '''
              const dynamic status;
            ''',
            emitter: emitter,
          ),
        );
      },
    );

    test(
      'should create a final field',
      () {
        const element = Field(
          name: 'status',
          modifier: FieldModifier.final_,
        );

        cExpect(
          element,
          cEquals(
            '''
              final dynamic status;
            ''',
            emitter: emitter,
          ),
        );
      },
    );

    test(
      'should create a field with modifiers in the correct order',
      () {
        const element = Field(
          name: 'status',
          isLate: true,
          isStatic: true,
          modifier: FieldModifier.final_,
        );

        cExpect(
          element,
          cEquals(
            '''
              static late final dynamic status;
            ''',
            emitter: emitter,
          ),
        );
      },
    );
  });
}
