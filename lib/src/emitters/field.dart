part of emitter;

/// {@template field_emitter}
///
/// {@endtemplate}
class FieldEmitter extends Emitter<Field> {
  /// {@macro field_emitter}
  FieldEmitter(super.context);

  @override
  StringSink emit(
    Field element, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    if (element.isStatic) {
      output.write('static ');
    }

    if (element.isLate) {
      output.write('late ');
    }

    switch (element.modifier) {
      case FieldModifier.const_:
        output.write('const ');
        break;

      case FieldModifier.final_:
        output.write('final ');
        break;

      default:
        break;
    }

    ReferenceEmitter(context).emit(element.type, output);

    output.write(' ${element.name}');
    output.write(';');

    return output;
  }
}
