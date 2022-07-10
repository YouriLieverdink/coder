part of emitter;

/// {@template parameter_emitter}
/// Transforms the [Parameter] element into Dart source code.
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

    if (element.kind == ParameterKind.named && element.isRequired) {
      output.write('required ');
    }

    if (!element.isToThis) {
      ReferenceEmitter(context).emit(element.type, output);
    }

    output
      ..write(element.isToThis ? ' this.' : ' ')
      ..write(element.name);

    if (element.assign != null) {
      output.write(' = ');

      StatementEmitter(context).emit(element.assign!, output);
    }

    return output;
  }
}

/// {@template parameter_list_emitter}
/// Transforms a list of the [Parameter] element into Dart source code.
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

      if (curr.kind != null && (prev == null || !(prev.kind != null))) {
        output.write(curr.kind == ParameterKind.named ? '{' : '[');
      }

      ParameterEmitter(context).emit(curr, output);

      if (curr != elements.last || context.useTraillingCommas) {
        output.write(', ');
      }

      if (curr.kind != null && (next == null || !(next.kind != null))) {
        output.write(curr.kind == ParameterKind.named ? '}' : ']');
      }
    }

    return output;
  }
}
