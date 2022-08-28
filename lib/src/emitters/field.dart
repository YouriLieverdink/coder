part of emitter;

/// {@template field_emitter}
/// Transforms the [Field] element into Dart source code.
/// {@endtemplate}
class FieldEmitter extends Emitter<Field> {
  /// {@macro field_emitter}
  const FieldEmitter(super.context);

  @override
  StringSink emit(
    Field element, [
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

    if (element.isStatic) {
      output.write('static ');
    }

    if (element.isLate) {
      output.write('late ');
    }

    switch (element.modifier) {
      case FieldModifier.final_:
        output.write('final ');
        break;

      case FieldModifier.const_:
        output.write('const ');
        break;

      default:
        break;
    }

    ReferenceEmitter(context).emit(element.type, output);

    output.write(' ${element.name}');

    if (element.assign != null) {
      output.write(' = ');

      ElementEmitter(context).emit(element.assign!, output);
    }

    output.write(';');

    return output;
  }
}
