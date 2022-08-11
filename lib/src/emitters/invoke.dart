part of emitter;

/// {@template invoke_emitter}
/// Transforms the [Invoke] into Dart source code.
/// {@endtemplate}
class InvokeEmitter extends Emitter<Invoke> {
  /// {@macro invoke_emitter}
  const InvokeEmitter(super.context);

  @override
  StringSink emit(
    Invoke value, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    output.write('(');

    for (final v in value.elements) {
      ElementEmitter(context).emit(v, output);

      if (v != value.elements.last || context.useTraillingCommas) {
        output.write(', ');
      }
    }

    output.write(')');

    return output;
  }
}
