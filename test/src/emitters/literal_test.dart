import 'package:orchestrator/orchestrator.dart';
import 'package:test/test.dart';

import '../../utilities/utilities.dart';

void main() {
  late Context context;
  late LiteralEmitter emitter;

  setUp(() {
    context = const Context();
    emitter = LiteralEmitter(context);
  });

  group(
    'LiteralBoolEmitter',
    () {
      test(
        'should emit a bool',
        () {
          const element = LiteralBool(true);

          Expect(
            element,
            Equals(
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
            Equals(
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
            Equals(
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
            Equals(
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
            Equals(
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
            Equals(
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
            Equals(
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
            Equals(
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
    'LiteralSetEmitter',
    () {
      test(
        'should emit a set',
        () {
          const element = LiteralSet({'Pip'});

          Expect(
            element,
            Equals(
              '''
                {'Pip'}
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a map-like type with a spread operator',
        () {
          final element = LiteralSet({
            const LiteralString('cat').named("'type'"),
            const Static('cat') //
                .spread
                .property('toJson')
                .invoke(),
          });

          Expect(
            element,
            Equals(
              '''
                {'type': 'cat', ...cat.toJson()}
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
            Equals(
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
