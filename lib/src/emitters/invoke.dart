part of emitter;

/// {@template invoke_emitter}
/// Transforms the [Invoke] into Dart source code.
/// {@endtemplate}
class InvokeEmitter extends Emitter<Invoke> {
  /// {@macro invoke_emitter}
  const InvokeEmitter(super.context);

  bool useTraillingCommas(
    Invoke element,
  ) {
    return context.useTraillingCommas && element.elements.length > 1;
  }

  @override
  StringSink emit(
    Invoke element, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    output.write('(');

    var index = 0;

    for (final v in element.elements) {
      ElementEmitter(context).emit(v, output);

      index++;

      if (index < element.elements.length || useTraillingCommas(element)) {
        output.write(', ');
      }
    }

    output.write(')');

    return output;
  }
}
