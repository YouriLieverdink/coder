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
            body: [
              StaticStatement('return cat.state;'),
            ],
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
    },
  );
}
