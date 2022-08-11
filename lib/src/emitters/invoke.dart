part of emitter;

/// {@template invoke_emitter}
/// Transforms the [Invoke] into Dart source code.
/// {@endtemplate}
class InvokeEmitter extends Emitter<Invoke> {
  /// {@macro invoke_emitter}
  const InvokeEmitter(super.context);

  @override
  StringSink emit(
    Invoke element, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    output.write('(');

    for (final v in element.elements) {
      ElementEmitter(context).emit(v, output);

      if (v != element.elements.last || context.useTraillingCommas) {
        output.write(', ');
      }
    }

    output.write(')');

    return output;
  }
}
