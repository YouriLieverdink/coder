part of emitter;

/// {@template for_emitter}
/// Transforms the [For] into Dart source code.
/// {@endtemplate}
class ForEmitter extends Emitter<For> {
  /// {@macro for_emitter}
  const ForEmitter(super.context);

  @override
  StringSink emit(
    For value, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    output.write('for (');

    ElementEmitter(context).emit(value.condition, output);

    output.write(') { ');

    for (final v in value.body) {
      ElementEmitter(context).emit(v, output);
    }

    output.write(' }');

    return output;
  }
}
