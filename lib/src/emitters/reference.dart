part of emitter;

class ReferenceEmitter extends Emitter<Reference> {
  @override
  StringSink emit(
    Reference element, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    if (element is TypeReference) {
      TypeReferenceEmitter().emit(element, output);
    } //
    else if (element is FunctionReference) {
      FunctionReferenceEmitter().emit(element, output);
    }

    return output;
  }
}

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
        ReferenceEmitter().emit(v, output);

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

    ReferenceEmitter().emit(element, output);

    output.write(' Function()');

    return output;
  }
}
