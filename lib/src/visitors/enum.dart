part of visitor;

StringSink visitEnum(
  Enum element, [
  StringSink? output,
]) {
  output ??= StringBuffer();

  output
    ..write('enum ${element.name} {')
    ..writeAll(element.values.map((v) => v.name), ',')
    ..write('}');

  return output;
}
