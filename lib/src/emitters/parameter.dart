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
class ParameterListEmitter extends ListEmitter<Parameter> {
  /// {@macro parameter_list_emitter}
  ParameterListEmitter(super.context);

  @override
  StringSink emit(
    List<Parameter> elements, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    final required_ = elements.where((v) => !v.isNamed && !v.isOptional);
    final named = elements.where((v) => v.isNamed);
    final optional = elements.where((v) => v.isOptional);

    for (final v in required_) {
      ParameterEmitter(context).emit(v, output);

      if (v != required_.last || named.isNotEmpty || optional.isNotEmpty) {
        output.write(',');
      }
    }

    if (named.isNotEmpty) {
      output.write('{');

      for (final v in named) {
        ParameterEmitter(context).emit(v, output);

        if (v != named.last) {
          output.write(',');
        }
      }

      output.write('}');
    }

    if (optional.isNotEmpty) {
      output.write('[');

      for (final v in optional) {
        ParameterEmitter(context).emit(v, output);

        if (v != optional.last) {
          output.write(',');
        }
      }

      output.write(']');
    }

    return output;
  }
}
