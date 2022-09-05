import 'package:orchestrator/orchestrator.dart';
import 'package:test/test.dart';

import '../../utilities/utilities.dart';

void main() {
  final context = Context();
  final emitter = MethodEmitter(context);

  group(
    'MethodEmitter',
    () {
      test(
        'should emit a method',
        () {
          const element = Method();

          Expect(
            element,
            Equals(
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
            Equals(
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
            Equals(
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
            Equals(
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
            Equals(
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
            Equals(
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
            Equals(
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
            Equals(
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
            Equals(
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
            Equals(
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
            Equals(
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
            Equals(
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
            Equals(
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
            Equals(
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
