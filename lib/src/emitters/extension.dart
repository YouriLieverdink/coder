part of emitter;

/// {@template extension_emitter}
/// Transforms the [Extension] element into Dart source code.
/// {@endtemplate}
class ExtensionEmitter extends Emitter<Extension> {
  /// {@macro extension_emitter}
  const ExtensionEmitter(super.context);

  @override
  StringSink emit(
    Extension element, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    for (final v in element.docs) {
      DocsEmitter(context).emit(v, output);

      output.write('\n');
    }

    for (final v in element.annotations) {
      AnnotationEmitter(context).emit(v, output);

      output.write('\n');
    }

    output.write('extension ');

    if (element.name != null) {
      output.write(element.name);
    }

    output.write(' on ');

    ReferenceEmitter(context).emit(element.on, output);

    output.write(' { ');

    for (final v in element.fields) {
      FieldEmitter(context).emit(v, output);

      output.writeln('\n');
    }

    for (final v in element.methods) {
      MethodEmitter(context).emit(v, output);

      output.writeln('\n');
    }

    output.write(' } ');

    return output;
  }
}
