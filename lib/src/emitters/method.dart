part of emitter;

/// {@template method_emitter}
///
/// {@endtemplate}
class MethodEmitter extends Emitter<Method> {
  /// {@macro method_emitter}
  const MethodEmitter(super.context);

  @override
  StringSink emit(
    Method value, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    if (value.isStatic) {
      output.write('static ');
    }

    ReferenceEmitter(context).emit(value.returns, output);

    output
      ..write(' ${value.name}')
      ..write('(');

    ParameterListEmitter(context).emit(value.parameters, output);

    output.write(') ');

    switch (value.modifier) {
      case MethodMofifier.async:
        output.write('async ');
        break;

      case MethodMofifier.asyncStar:
        output.write('async* ');
        break;

      case MethodMofifier.syncStar:
        output.write('sync* ');
        break;

      default:
        break;
    }

    output.write('{');

    for (final v in value.body) {
      StatementEmitter(context).emit(v, output);
    }

    output.write(' }');

    return output;
  }
}
