import 'package:coder/coder.dart';
import 'package:test/test.dart';

void main() {
  const context = Context();

  group('FieldEmitter', () {
    test(
      'should create a Field',
      () {
        const element = Field(name: 'status');

        final result = FieldEmitter(context) //
            .emit(element)
            .toString();

        expect(
          result,
          equals('dynamic status;'),
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

        final result = FieldEmitter(context) //
            .emit(element)
            .toString();

        expect(
          result,
          equals('Future<Status> Function() getStatus;'),
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

        final result = FieldEmitter(context) //
            .emit(element)
            .toString();

        expect(
          result,
          equals('static dynamic status;'),
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

        final result = FieldEmitter(context) //
            .emit(element)
            .toString();

        expect(
          result,
          equals('late dynamic status;'),
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

        final result = FieldEmitter(context) //
            .emit(element)
            .toString();

        expect(
          result,
          equals('const dynamic status;'),
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

        final result = FieldEmitter(context) //
            .emit(element)
            .toString();

        expect(
          result,
          equals('final dynamic status;'),
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

        final result = FieldEmitter(context) //
            .emit(element)
            .toString();

        expect(
          result,
          equals('late static final dynamic status;'),
        );
      },
    );
  });
}
