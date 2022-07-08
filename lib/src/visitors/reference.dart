part of visitor;

StringSink visitTypeReference(
  TypeReference element, [
  StringSink? output,
]) {
  output ??= StringBuffer();

  output.write(element.symbol);

  if (element.types.isNotEmpty) {
    output.write('<');

    for (final v in element.types) {
      v.visit(output);

      if (v != element.types.last) {
        output.write(',');
      }
    }

    output.write('>');
  }

  if (element.isNullable) {
    output.write('?');
  }

  return output;
}

StringSink visitFunctionReference(
  FunctionReference element, [
  StringSink? output,
]) {
  output ??= StringBuffer();

  element.returns.visit(output);

  output.write(' Function()');

  return output;
}
