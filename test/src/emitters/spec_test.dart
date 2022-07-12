import 'package:orchestrator/orchestrator.dart';
import 'package:test/test.dart';

import '../../utilities/utilities.dart';

void main() {
  const context = Context();
  const emitter = ElementEmitter(context);

  group(
    'SpecEmitter',
    () {
      test(
        'should emit a class',
        () {
          const element = Class(name: 'Cat');

          Expect(
            element,
            const Equals(
              '''
                class Cat {
                }
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should throw when a constructor is provided',
        () {
          const element = Constructor();

          expect(
            () => emitter.emit(element),
            throwsA(isA<UnsupportedError>()),
          );
        },
      );

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
        'should emit an extension',
        () {
          const element = Extension(
            on: TypeReference('Cat'),
          );

          Expect(
            element,
            const Equals(
              '''
                extension on Cat {
                }
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a field',
        () {
          const element = Field(
            name: 'state',
          );

          Expect(
            element,
            const Equals(
              '''
                dynamic state;
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a method',
        () {
          const element = Method(
            name: 'getState',
            returns: TypeReference('CatState'),
          );

          Expect(
            element,
            const Equals(
              '''
                CatState getState() {
                }
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a parameter',
        () {
          const element = Parameter(
            name: 'state',
          );

          Expect(
            element,
            const Equals(
              '''
                dynamic state 
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a type reference',
        () {
          const element = TypeReference('String');

          Expect(
            element,
            const Equals(
              '''
                String
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a statement',
        () {
          const statement = Literal('cat');

          Expect(
            statement,
            const Equals(
              '''
                'cat'
              ''',
              emitter: emitter,
            ),
          );
        },
      );
    },
  );
}
