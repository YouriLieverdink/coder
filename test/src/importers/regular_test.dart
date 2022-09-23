import 'package:orchestrator/orchestrator.dart';
import 'package:test/test.dart';

import '../../utilities/utilities.dart';

void main() {
  late Importer importer;
  late Context context;
  late Emitter emitter;

  setUp(() {
    importer = RegularImporter();
    context = Context(importer: importer);

    emitter = ElementEmitter(context);
  });

  group(
    'RegularImporter',
    () {
      test(
        'should register a reference',
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
              Directive.import('package:equatable/equatable.dart'),
            ),
          );
        },
      );

      test(
        'should not emit excluded dependencies',
        () {
          const element = Library(
            elements: [
              TypeReference(
                'String',
                url: 'dart:core',
              ),
            ],
          );

          Expect(
            element,
            Equals(
              '''
                String
              ''',
              emitter: emitter,
            ),
          );
        },
      );
    },
  );
}
