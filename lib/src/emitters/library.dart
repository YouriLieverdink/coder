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

    final directives = [...context.importer.imports, ...element.directives];

    directives.sort();

    int? index;

    for (final v in directives) {
      // When it's not the first, and not the same, add extra spacing.
      if (index != null && index != v.index) {
        output.write('\n');
      }

      index = v.index;

      DirectiveEmitter(context).emit(v, output);

      output.write('\n');
    }

    output.write(content);

    return output;
  }
}
