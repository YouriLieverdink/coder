import 'package:orchestrator/orchestrator.dart';
import 'package:test/test.dart';

import '../../utilities/utilities.dart';

void main() {
  const context = Context();
  const emitter = MethodEmitter(context);

  group(
    'MethodEmitter',
    () {
      test(
        'should emit a method',
        () {
          const element = Method();

          Expect(
            element,
            const Equals(
              '''
                () {
                }
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a method with a name',
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
        'should emit a method with parameters',
        () {
          const element = Method(
            name: 'getState',
            returns: TypeReference('CatState'),
            parameters: [
              Parameter(
                type: TypeReference('Cat'),
                name: 'cat',
              ),
            ],
          );

          Expect(
            element,
            const Equals(
              '''
                CatState getState(Cat cat) {
                }
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a static method',
        () {
          const element = Method(
            name: 'getState',
            returns: TypeReference('CatState'),
            isStatic: true,
          );

          Expect(
            element,
            const Equals(
              '''
                static CatState getState() {
                }
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit an async method',
        () {
          const element = Method(
            name: 'getState',
            returns: TypeReference('CatState'),
            modifier: MethodMofifier.async,
          );

          Expect(
            element,
            const Equals(
              '''
                CatState getState() async {
                }
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit an async* method',
        () {
          const element = Method(
            name: 'getState',
            returns: TypeReference('CatState'),
            modifier: MethodMofifier.asyncStar,
          );

          Expect(
            element,
            const Equals(
              '''
                CatState getState() async* {
                }
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit an syncStar method',
        () {
          const element = Method(
            name: 'getState',
            returns: TypeReference('CatState'),
            modifier: MethodMofifier.syncStar,
          );

          Expect(
            element,
            const Equals(
              '''
                CatState getState() sync* {
                }
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a method with a body',
        () {
          const element = Method(
            name: 'getState',
            returns: TypeReference('CatState'),
            parameters: [
              Parameter(
                name: 'cat',
                type: TypeReference('Cat'),
              ),
            ],
            body: Column([
              Static('return cat.state;'),
            ]),
          );

          Expect(
            element,
            const Equals(
              '''
                CatState getState(Cat cat) {
                  return cat.state;
                }
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a method with docs',
        () {
          const element = Method(
            name: 'getState',
            returns: TypeReference('void'),
            docs: [
              Docs('Returns the state of a cat'),
            ],
          );

          Expect(
            element,
            const Equals(
              '''
                /// Returns the state of a cat
                void getState() {
                }
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit an anonymous method',
        () {
          const element = Method(
            parameters: [
              Parameter(
                name: 'v',
              ),
            ],
          );

          Expect(
            element,
            const Equals(
              '''
                (v) {
                }
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a lambda method',
        () {
          const element = Method(
            lambda: true,
            parameters: [
              Parameter(
                name: 'v',
              ),
            ],
            body: Static('print("Hello!")'),
          );

          Expect(
            element,
            const Equals(
              '''
                (v) => print("Hello!")
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a method with annotations',
        () {
          const element = Method(
            name: 'getState',
            returns: TypeReference('void'),
            annotations: [
              Annotation('Deprecated'),
            ],
          );

          Expect(
            element,
            const Equals(
              '''
                @Deprecated
                void getState() {
                }
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a get method',
        () {
          const element = Method(
            name: 'state',
            returns: TypeReference('CatState'),
            kind: MethodKind.get,
          );

          Expect(
            element,
            const Equals(
              '''
                CatState get state {
                }
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a set method',
        () {
          const element = Method(
            name: 'state',
            returns: TypeReference('void'),
            kind: MethodKind.set,
            parameters: [
              Parameter(
                name: 'state',
                type: TypeReference('CatState'),
              ),
            ],
          );

          Expect(
            element,
            const Equals(
              '''
                void set state(CatState state) {
                }
              ''',
              emitter: emitter,
            ),
          );
        },
      );
    },
  );
}
