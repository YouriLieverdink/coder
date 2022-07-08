part of visitor;

StringSink visitReference(
  Reference element, [
  StringSink? output,
]) {
  output ??= StringBuffer();

  output.write(element.symbol);

  if (element.types.isNotEmpty) {
    output
      ..write('<')
      ..writeAll(element.types.map((v) => visitReference(v)), ',')
      ..write('>');
  }

  if (element.isNullable) {
    output.write('?');
  }

  return output;
}
