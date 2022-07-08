part of emitter;

class ClassEmitter extends Emitter<Class> {
  @override
  StringSink emit(
    Class element, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    output.write('class ${element.name}');

    if (element.extends_ != null) {
      output.write(' extends ');
      ReferenceEmitter().emit(element.extends_!, output);
    }

    output.write(' {');

    for (final v in element.fields) {
      FieldEmitter().emit(v, output);
    }

    output.write('}');

    return output;
  }
}
