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

    for (final v in element.directives) {
      DirectiveEmitter(context).emit(v, output);
    }

    for (final v in element.elements) {
      ElementEmitter(context).emit(v, output);

      output.writeln('\n');
    }

    return output;
  }
}
