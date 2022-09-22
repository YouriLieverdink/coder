import 'package:orchestrator/orchestrator.dart';
import 'package:test/test.dart';

void main() {
  final importer = RegularImporter();
  final context = Context(importer: importer);
  final emitter = ElementEmitter(context);

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
    },
  );
}
