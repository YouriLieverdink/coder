part of emitter;

/// {@template method_emitter}
/// Transforms the [Method] element into Dart source code.
/// {@endtemplate}
class MethodEmitter extends Emitter<Method> {
  /// {@macro method_emitter}
  const MethodEmitter(super.context);

  @override
  StringSink emit(
    Method element, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    for (final v in element.docs) {
      DocsEmitter(context).emit(v, output);

      output.write('\n');
    }

    if (element.isStatic) {
      output.write('static ');
    }

    ReferenceEmitter(context).emit(element.returns, output);

    output
      ..write(' ${element.name}')
      ..write('(');

    ParameterListEmitter(context).emit(element.parameters, output);

    output.write(') ');

    switch (element.modifier) {
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

    output.write('{ ');

    if (element.body != null) {
      ElementEmitter(context).emit(element.body!, output);
    }

    output.write(' }');

    return output;
  }
}
