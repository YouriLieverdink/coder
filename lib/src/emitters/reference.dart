part of emitter;

class TypeReferenceEmitter extends Emitter<TypeReference> {
  @override
  StringSink emit(
    TypeReference element, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    output.write(element.symbol);

    if (element.types.isNotEmpty) {
      output.write('<');

      for (final v in element.types) {
        v.emit(output);

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
}

class FunctionReferenceEmitter extends Emitter<FunctionReference> {
  @override
  StringSink emit(
    FunctionReference element, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    element.returns.emit(output);

    output.write(' Function()');

    return output;
  }
}
