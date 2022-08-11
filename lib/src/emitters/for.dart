part of emitter;

/// {@template for_emitter}
/// Transforms the [For] into Dart source code.
/// {@endtemplate}
class ForEmitter extends Emitter<For> {
  /// {@macro for_emitter}
  const ForEmitter(super.context);

  @override
  StringSink emit(
    For element, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    output.write('for (');

    ElementEmitter(context).emit(element.condition, output);

    output.write(') { ');

    if (element.body != null) {
      ElementEmitter(context).emit(element.body!, output);
    }

    output.write(' }');

    return output;
  }
}
