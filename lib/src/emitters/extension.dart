part of emitter;

/// {@template extension_emitter}
/// Transforms the [Extension] element into Dart source code.
/// {@endtemplate}
class ExtensionEmitter extends Emitter<Extension> {
  /// {@macro extension_emitter}
  const ExtensionEmitter(super.context);

  @override
  StringSink emit(
    Extension value, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    output.write('extension ');

    if (value.name != null) {
      output.write(value.name);
    }

    output.write(' on ');

    ReferenceEmitter(context).emit(value.on, output);

    output.write(' { ');

    for (final v in value.fields) {
      FieldEmitter(context).emit(v, output);

      output.writeln('\n');
    }

    for (final v in value.methods) {
      MethodEmitter(context).emit(v, output);

      output.writeln('\n');
    }

    output.write(' } ');

    return output;
  }
}
