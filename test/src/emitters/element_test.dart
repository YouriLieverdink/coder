import 'package:orchestrator/orchestrator.dart' hide isA;
import 'package:test/test.dart';

import '../../utilities/utilities.dart';

void main() {
  const context = Context();
  const emitter = ElementEmitter(context);

  group(
    'ElementEmitter',
    () {
      test(
        'should emit a block of elements',
        () {
          const element = Column([
            Static('// Hello, my name is Pip!'),
            Static('final cat = Cat(name: "Pip");'),
          ]);

          Expect(
            element,
            const Equals(
              '''
                // Hello, my name is Pip!
                final cat = Cat(name: "Pip");
              ''',
              emitter: emitter,
            ),
          );
        },
      );

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
        'should emit a for',
        () {
          const element = For(
            condition: Static('int i = 0; i < 10; i++'),
            body: Column([
              Static('print(i);'),
            ]),
          );

          Expect(
            element,
            const Equals(
              '''
                for (int i = 0; i < 10; i++) {
                  print(i);
                }
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit an if',
        () {
          const element = IfElse(
            condition: Static('i > 42'),
            then: Column([
              Static("print('Found the meaning of life!');"),
            ]),
          );

          Expect(
            element,
            const Equals(
              '''
                if (i > 42) {
                  print('Found the meaning of life!');
                }
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a literal',
        () {
          const statement = LiteralBool(true);

          Expect(
            statement,
            const Equals(
              '''
                true
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
        'should emit a row of elements',
        () {
          const element = Row([
            Static('final '),
            Static('cat'),
            Static(' = '),
            Static('Cat()'),
          ]);

          Expect(
            element,
            const Equals(
              '''
                final cat = Cat()
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a static',
        () {
          const element = Static('print("Hello, world");');

          Expect(
            element,
            const Equals(
              '''
              print("Hello, world");
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a switch',
        () {
          const element = Switch(
            condition: Static('cat.state'),
          );

          Expect(
            element,
            const Equals(
              '''
                switch (cat.state) {
                }
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a try-catch block',
        () {
          const element = TryCatch(
            try_: Column([
              Static('cat.pickUp();'),
            ]),
            catch_: Column([
              Static('print("ouch!");'),
            ]),
          );

          Expect(
            element,
            const Equals(
              '''
                try {
                  cat.pickUp();
                } catch (e) {
                  print("ouch!");
                }
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a while',
        () {
          const element = While(
            condition: Static('i < 42'),
            body: Column([
              Static('i++;'),
            ]),
          );

          Expect(
            element,
            const Equals(
              '''
                while (i < 42) {
                  i++;
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
