part of emitter;

/// {@template field_emitter}
/// Transforms the [Field] element into Dart source code.
/// {@endtemplate}
class FieldEmitter extends Emitter<Field> {
  /// {@macro field_emitter}
  const FieldEmitter(super.context);

  @override
  StringSink emit(
    Field value, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    if (value.isStatic) {
      output.write('static ');
    }

    if (value.isLate) {
      output.write('late ');
    }

    switch (value.modifier) {
      case FieldModifier.final_:
        output.write('final ');
        break;

      case FieldModifier.const_:
        output.write('const ');
        break;

      default:
        break;
    }

    ReferenceEmitter(context).emit(value.type, output);

    output.write(' ${value.name}');

    if (value.assign != null) {
      output.write(' = ');

      ElementEmitter(context).emit(value.assign!, output);
    }

    output.write(';');

    return output;
  }
}
