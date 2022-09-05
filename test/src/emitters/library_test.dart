import 'package:orchestrator/orchestrator.dart';
import 'package:test/test.dart';

import '../../utilities/utilities.dart';

void main() {
  final context = Context();
  final emitter = LibraryEmitter(context);

  group(
    'LibraryEmitter',
    () {
      test(
        'should emit a library',
        () {
          const element = Library(
            elements: [
              Enum(
                name: 'CatState',
                values: [
                  EnumValue('sleeping'),
                  EnumValue('eating'),
                ],
              ),
            ],
          );

          Expect(
            element,
            Equals(
              '''
                enum CatState { sleeping, eating }
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a library with a name',
        () {
          const element = Library(
            name: 'enums',
            elements: [
              Enum(
                name: 'CatState',
                values: [
                  EnumValue('sleeping'),
                  EnumValue('eating'),
                ],
              ),
            ],
          );

          Expect(
            element,
            Equals(
              '''
                library enums;

                enum CatState { sleeping, eating }
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a library with directives',
        () {
          const element = Library(
            directives: [
              Directive(
                url: 'dart:core',
                kind: DirectiveKind.import,
              ),
              Directive(
                url: 'package:test/test.dart',
                kind: DirectiveKind.import,
              ),
            ],
          );

          Expect(
            element,
            Equals(
              '''
                import 'dart:core';
                import 'package:test/test.dart';
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'emits a library with spaced out elements',
        () {
          const element = Library(
            elements: [
              Enum(
                name: 'CatState',
                values: [
                  EnumValue('sleeping'),
                  EnumValue('eating'),
                ],
              ),
              Enum(
                name: 'DogState',
                values: [
                  EnumValue('barking'),
                  EnumValue('walking'),
                ],
              ),
            ],
          );

          Expect(
            element,
            Equals(
              '''
                enum CatState { sleeping, eating }

                enum DogState { barking, walking }
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a library with docs',
        () {
          const element = Library(
            name: 'cats_and_dogs',
            docs: [
              Docs('This is an awesome library!'),
            ],
          );

          Expect(
            element,
            Equals(
              '''
                /// This is an awesome library!
                library cats_and_dogs;
              ''',
              emitter: emitter,
            ),
          );
        },
      );
    },
  );
}
