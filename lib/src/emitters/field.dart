part of emitter;

class FieldEmitter extends Emitter<Field> {
  @override
  StringSink emit(
    Field element, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    if (element.isLate) {
      output.write('late ');
    }

    if (element.isStatic) {
      output.write('static ');
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

    ReferenceEmitter().emit(element.type, output);

    output.write(' ${element.name}');
    output.write(';');

    return output;
  }
}
