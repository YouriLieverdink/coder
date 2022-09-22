import 'package:orchestrator/orchestrator.dart';
import 'package:test/test.dart';

import '../../utilities/utilities.dart';

void main() {
  late Importer importer;
  late Context context;
  late Emitter emitter;

  setUp(() {
    importer = PrefixImporter();
    context = Context(importer: importer);

    emitter = ElementEmitter(context);
  });

  group(
    'RegularImporter',
    () {
      test(
        'should register a prefixed reference',
        () {
          const element = Library(
            elements: [
              TypeReference(
                'Equatable',
                url: 'package:equatable/equatable.dart',
              ),
            ],
          );

          emitter.emit(element);

          expect(
            importer.imports,
            contains(
              Directive.import(
                'package:equatable/equatable.dart',
                as: '_i1',
              ),
            ),
          );
        },
      );

      test(
        'should increase the import counter with multiple imports',
        () {
          const element = Library(
            elements: [
              TypeReference(
                'Equatable',
                url: 'package:equatable/equatable.dart',
              ),
              TypeReference(
                'String',
                url: 'dart:core',
              ),
            ],
          );

          emitter.emit(element);

          expect(
            importer.imports,
            containsAll([
              Directive.import(
                'package:equatable/equatable.dart',
                as: '_i1',
              ),
              Directive.import(
                'dart:core',
                as: '_i2',
              ),
            ]),
          );
        },
      );

      test(
        'should emit prefixed references',
        () {
          const element = Library(
            elements: [
              TypeReference(
                'Equatable',
                url: 'package:equatable/equatable.dart',
              ),
            ],
          );

          Expect(
            element,
            Equals(
              '''
                import 'package:equatable/equatable.dart' as _i1;

                _i1.Equatable
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit the same prefix for duplicate dependencies',
        () {
          const element = Library(
            elements: [
              TypeReference(
                'String',
                url: 'dart:core',
              ),
              TypeReference(
                'Equatable',
                url: 'package:equatable/equatable.dart',
              ),
              TypeReference(
                'Equatable',
                url: 'package:equatable/equatable.dart',
              ),
            ],
          );

          Expect(
            element,
            Equals(
              '''
                import 'dart:core' as _i1;
                import 'package:equatable/equatable.dart' as _i2;

                _i1.String
                _i2.Equatable
                _i2.Equatable
              ''',
              emitter: emitter,
            ),
          );
        },
      );
    },
  );
}
