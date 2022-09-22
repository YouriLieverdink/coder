import 'package:orchestrator/orchestrator.dart';
import 'package:test/test.dart';

import '../../utilities/utilities.dart';

void main() {
  const context = Context();
  const emitter = LiteralEmitter(context);

  group(
    'LiteralBoolEmitter',
    () {
      test(
        'should emit a bool',
        () {
          const element = LiteralBool(true);

          Expect(
            element,
            const Equals(
              '''
                true
              ''',
              emitter: emitter,
            ),
          );
        },
      );
    },
  );

  group(
    'LiteralListEmitter',
    () {
      test(
        'should emit a list',
        () {
          const element = LiteralList(['cat', 'dog']);

          Expect(
            element,
            const Equals(
              '''
                ['cat', 'dog']
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a list with nested elements',
        () {
          const element = LiteralList(['cat', TypeReference('Cat')]);

          Expect(
            element,
            const Equals(
              '''
                ['cat', Cat]
              ''',
              emitter: emitter,
            ),
          );
        },
      );
    },
  );

  group(
    'LiteralMapEmitter',
    () {
      test(
        'should emit a map',
        () {
          const element = LiteralMap({
            'cats': ['Pip', 'Bo'],
          });

          Expect(
            element,
            const Equals(
              '''
                {
                  'cats': ['Pip', 'Bo']
                }
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a map with nested elements',
        () {
          final element = LiteralMap({
            'cats': const LiteralList(['Pip']),
            const TypeReference('Cat'): 'new',
          });

          Expect(
            element,
            const Equals(
              '''
                {
                  'cats': ['Pip'],
                  Cat: 'new'
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
    'LiteralNullEmitter',
    () {
      test(
        'should emit null',
        () {
          const element = LiteralNull();

          Expect(
            element,
            const Equals(
              '''
                null
              ''',
              emitter: emitter,
            ),
          );
        },
      );
    },
  );

  group(
    'LiteralNumEmitter',
    () {
      test(
        'should emit an int',
        () {
          const element = LiteralNum(42);

          Expect(
            element,
            const Equals(
              '''
                42
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a double',
        () {
          const element = LiteralNum(42.0);

          Expect(
            element,
            const Equals(
              '''
                42.0
              ''',
              emitter: emitter,
            ),
          );
        },
      );
    },
  );

  group(
    'LiteralStringEmitter',
    () {
      test(
        'should emit a string',
        () {
          const element = LiteralString('Pip');

          Expect(
            element,
            const Equals(
              '''
                'Pip'
              ''',
              emitter: emitter,
            ),
          );
        },
      );
    },
  );
}
