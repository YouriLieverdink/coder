part of emitter;

/// {@template reference_emitter}
///
/// {@endtemplate}
class ReferenceEmitter extends Emitter<Reference> {
  /// {@macro reference_emitter}
  ReferenceEmitter(super.context);

  @override
  StringSink emit(
    Reference element, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    if (element is TypeReference) {
      TypeReferenceEmitter(context).emit(element, output);
    } //
    else if (element is FunctionReference) {
      FunctionReferenceEmitter(context).emit(element, output);
    }

    return output;
  }
}

/// {@template type_reference_emitter}
///
/// {@endtemplate}
class TypeReferenceEmitter extends Emitter<TypeReference> {
  /// {@macro type_reference_emitter}
  TypeReferenceEmitter(super.context);

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
        ReferenceEmitter(context).emit(v, output);

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

/// {@template function_reference_emitter}
///
/// {@endtemplate}
class FunctionReferenceEmitter extends Emitter<FunctionReference> {
  /// {@macro function_reference_emitter}
  FunctionReferenceEmitter(super.context);

  @override
  StringSink emit(
    FunctionReference element, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    ReferenceEmitter(context).emit(element.returns, output);

    output.write(' Function(');

    ParameterListEmitter(context).emit(element.parameters, output);

    output.write(')');

    return output;
  }
}
