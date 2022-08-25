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

    if (element.returns != null) {
      ReferenceEmitter(context).emit(element.returns!, output);
    }

    if (element.name != null) {
      output.write(' ${element.name}');
    }

    output.write('(');

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

    if (element.lambda) {
      output.write('=> ');
    } //
    else {
      output.write('{ ');
    }

    if (element.body != null) {
      ElementEmitter(context).emit(element.body!, output);
    }

    if (!element.lambda) {
      output.write(' }');
    }

    return output;
  }
}
