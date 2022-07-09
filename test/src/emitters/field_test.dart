import 'package:coder/coder.dart';
import 'package:test/test.dart';

import '../../matchers/equals_code.dart';

void main() {
  group('FieldEmitter', () {
    test(
      'should create a Field',
      () {
        const element = Field(name: 'status');

        expect(
          element,
          const EqualsCode(
            '''
              dynamic status;
            ''',
          ),
        );
      },
    );

    test(
      'should create a Field with a custom type',
      () {
        const element = Field(
          name: 'getStatus',
          type: FunctionReference(
            returns: TypeReference(
              'Future',
              types: [
                TypeReference('Status'),
              ],
            ),
          ),
        );

        expect(
          element,
          const EqualsCode(
            '''
              Future<Status> Function() getStatus;
            ''',
          ),
        );
      },
    );

    test(
      'should create a static Field when isStatic is true',
      () {
        const element = Field(
          name: 'status',
          isStatic: true,
        );

        expect(
          element,
          const EqualsCode(
            '''
              static dynamic status;
            ''',
          ),
        );
      },
    );

    test(
      'should create a late Field when isLate is true',
      () {
        const element = Field(
          name: 'status',
          isLate: true,
        );

        expect(
          element,
          const EqualsCode(
            '''
              late dynamic status;
            ''',
          ),
        );
      },
    );

    test(
      'should create a const Field when Kind is const_',
      () {
        const element = Field(
          name: 'status',
          modifier: FieldModifier.const_,
        );

        expect(
          element,
          const EqualsCode(
            '''
              const dynamic status;
            ''',
          ),
        );
      },
    );

    test(
      'should create a final Field when Kind is final_',
      () {
        const element = Field(
          name: 'status',
          modifier: FieldModifier.final_,
        );

        expect(
          element,
          const EqualsCode(
            '''
              final dynamic status;
            ''',
          ),
        );
      },
    );

    test(
      'should create a Field with modifiers in the correct order',
      () {
        const element = Field(
          name: 'status',
          isLate: true,
          isStatic: true,
          modifier: FieldModifier.final_,
        );

        expect(
          element,
          const EqualsCode(
            '''
              static late final dynamic status;
            ''',
          ),
        );
      },
    );
  });
}
