part of visitor;

StringSink visitEnum(
  Enum element, [
  StringSink? output,
]) {
  output ??= StringBuffer();

  output.write('enum ${element.name} {');

  for (final v in element.values) {
    v.visit(output);

    if (v != element.values.last) {
      output.write(',');
    }
  }

  output.write('}');

  return output;
}

StringSink visitEnumValue(
  EnumValue element, [
  StringSink? output,
]) {
  //
  output ??= StringBuffer();

  output.write(element.name);

  return output;
}
