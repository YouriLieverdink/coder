part of emitter;

/// {@template library_emitter}
/// Emits the [Library] configuration into Dart source code.
/// {@endtemplate}
class LibraryEmitter extends Emitter<Library> {
  /// {@macro library_emitter}
  const LibraryEmitter(super.context);

  @override
  StringSink emit(
    Library element, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    for (final v in element.docs) {
      DocsEmitter(context).emit(v, output);

      output.write('\n');
    }

    if (element.name != null) {
      output
        ..write('library ')
        ..write(element.name)
        ..write(';')
        ..writeln('\n');
    }

    final content = StringBuffer();

    for (final v in element.elements) {
      ElementEmitter(context).emit(v, content);

      content.writeln('\n');
    }

    // Retrieve all imports from the importer and emit them als directives.
    for (final v in context.importer.imports) {
      final import = Directive.import(v);

      DirectiveEmitter(context).emit(import, output);

      output.write('\n');
    }

    for (final v in element.directives) {
      DirectiveEmitter(context).emit(v, output);

      output.write('\n');
    }

    output.write(content);

    return output;
  }
}
