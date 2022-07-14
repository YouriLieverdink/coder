part of emitter;

/// {@template method_emitter}
/// Transforms the [Method] element into Dart source code.
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

    if (value.body != null) {
      ElementEmitter(context).emit(value.body!, output);
    }

    output.write(' }');

    return output;
  }
}
