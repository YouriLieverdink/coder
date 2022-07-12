part of emitter;

/// {@template parameter_emitter}
/// Transforms the [Parameter] element into Dart source code.
/// {@endtemplate}
class ParameterEmitter extends Emitter<Parameter> {
  /// {@macro parameter_emitter}
  const ParameterEmitter(super.context);

  @override
  StringSink emit(
    Parameter value, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    if (value.kind == ParameterKind.named && value.isRequired) {
      output.write('required ');
    }

    if (!value.isToThis) {
      ReferenceEmitter(context).emit(value.type, output);
    }

    output
      ..write(value.isToThis ? ' this.' : ' ')
      ..write(value.name);

    if (value.assign != null) {
      output.write(' = ');

      ElementEmitter(context).emit(value.assign!, output);
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

  T? valueAtOrNull<T>(List<T> values, int index) {
    try {
      return values[index];
    } //
    catch (_) {
      return null;
    }
  }

  @override
  StringSink emit(
    List<Parameter> values, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    for (int i = 0; i < values.length; i++) {
      //
      final prev = valueAtOrNull(values, i - 1);
      final curr = values[i];
      final next = valueAtOrNull(values, i + 1);

      if (curr.kind != null && (prev == null || !(prev.kind != null))) {
        output.write(curr.kind == ParameterKind.named ? '{' : '[');
      }

      ParameterEmitter(context).emit(curr, output);

      if (curr != values.last || context.useTraillingCommas) {
        output.write(', ');
      }

      if (curr.kind != null && (next == null || !(next.kind != null))) {
        output.write(curr.kind == ParameterKind.named ? '}' : ']');
      }
    }

    return output;
  }
}
