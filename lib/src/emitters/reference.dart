part of emitter;

/// {@template reference_emitter}
/// Transforms the [Reference] element into Dart source code.
/// {@endtemplate}
class ReferenceEmitter extends Emitter<Reference> {
  /// {@macro reference_emitter}
  const ReferenceEmitter(super.context);

  @override
  StringSink emit(
    Reference value, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    if (value is TypeReference) {
      TypeReferenceEmitter(context).emit(value, output);
    } //
    else if (value is FunctionReference) {
      FunctionReferenceEmitter(context).emit(value, output);
    }

    return output;
  }
}

/// {@template type_reference_emitter}
/// Transforms the [TypeReference] element into Dart source code.
/// {@endtemplate}
class TypeReferenceEmitter extends Emitter<TypeReference> {
  /// {@macro type_reference_emitter}
  const TypeReferenceEmitter(super.context);

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
/// Transforms the [FunctionReference] element into Dart source code.
/// {@endtemplate}
class FunctionReferenceEmitter extends Emitter<FunctionReference> {
  /// {@macro function_reference_emitter}
  const FunctionReferenceEmitter(super.context);

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
