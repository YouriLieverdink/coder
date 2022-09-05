import 'package:orchestrator/orchestrator.dart';
import 'package:test/test.dart';

import '../../utilities/utilities.dart';

void main() {
  final context = Context();
  final emitter = FieldEmitter(context);

  group(
    'FieldEmitter',
    () {
      test(
        'should emit a field',
        () {
          const element = Field(
            name: 'state',
          );

          Expect(
            element,
            Equals(
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

          Expect(
            element,
            Equals(
              '''
                CatState state;
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a field with an assignment',
        () {
          const element = Field(
            name: 'state',
            type: TypeReference('CatState'),
            assign: Static('CatState.purring'),
          );

          Expect(
            element,
            Equals(
              '''
                CatState state = CatState.purring;
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

          Expect(
            element,
            Equals(
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

          Expect(
            element,
            Equals(
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

          Expect(
            element,
            Equals(
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

          Expect(
            element,
            Equals(
              '''
                late dynamic state;
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a field with docs',
        () {
          const element = Field(
            name: 'state',
            docs: [
              Docs('Indicates whatever the cat is doing'),
            ],
          );

          Expect(
            element,
            Equals(
              '''
                /// Indicates whatever the cat is doing
                dynamic state;
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a field with annotations',
        () {
          const element = Field(
            name: 'state',
            annotations: [
              Annotation('override'),
            ],
          );

          Expect(
            element,
            Equals(
              '''
                @override
                dynamic state;
              ''',
              emitter: emitter,
            ),
          );
        },
      );
    },
  );
}
