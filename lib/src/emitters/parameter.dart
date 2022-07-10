part of emitter;

/// {@template parameter_emitter}
///
/// {@endtemplate}
class ParameterEmitter extends Emitter<Parameter> {
  /// {@macro parameter_emitter}
  const ParameterEmitter(super.context);

  @override
  StringSink emit(
    Parameter element, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    if (element.isNamed && element.isRequired) {
      output.write('required ');
    }

    if (!element.isToThis) {
      ReferenceEmitter(context).emit(element.type, output);
    }

    output
      ..write(element.isToThis ? ' this.' : ' ')
      ..write(element.name);

    return output;
  }
}

/// {@template parameter_list_emitter}
///
/// {@endtemplate}
class ParameterListEmitter extends Emitter<List<Parameter>> {
  /// {@macro parameter_list_emitter}
  const ParameterListEmitter(super.context);

  T? elementAtOrNull<T>(List<T> elements, int index) {
    try {
      return elements[index];
    } //
    catch (_) {
      return null;
    }
  }

  @override
  StringSink emit(
    List<Parameter> elements, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    for (int i = 0; i < elements.length; i++) {
      //
      final prev = elementAtOrNull(elements, i - 1);
      final curr = elements[i];
      final next = elementAtOrNull(elements, i + 1);

      if (curr.isNamed && (prev == null || !prev.isNamed)) {
        output.write('{');
      }

      if (curr.isOptional && (prev == null || !prev.isOptional)) {
        output.write('[');
      }

      ParameterEmitter(context).emit(curr, output);

      if (curr.isNamed && (next == null || !next.isNamed)) {
        output.write('}');
      }

      if (curr.isOptional && (next == null || !next.isOptional)) {
        output.write(']');
      }

      if (curr != elements.last) {
        output.write(', ');
      }
    }

    return output;
  }
}
