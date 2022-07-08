part of emitter;

class EnumEmitter extends Emitter<Enum> {
  @override
  StringSink emit(
    Enum element, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    output.write('enum ${element.name} {');

    for (final v in element.values) {
      EnumValueEmitter().emit(v, output);

      if (v != element.values.last) {
        output.write(',');
      }
    }

    output.write('}');

    return output;
  }
}

class EnumValueEmitter extends Emitter<EnumValue> {
  @override
  StringSink emit(
    EnumValue element, [
    StringSink? output,
  ]) {
    //
    output ??= StringBuffer();

    output.write(element.name);

    return output;
  }
}
