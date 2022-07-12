part of emitter;

/// {@template if_emitter}
/// Transforms the [If] into Dart source code.
/// {@endtemplate}
class IfEmitter extends Emitter<If> {
  /// {@macro if_emitter}
  const IfEmitter(super.context);

  @override
  StringSink emit(
    If value, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    output.write('if (');

    ElementEmitter(context).emit(value.condition, output);

    output.write(') { ');

    for (final v in value.then) {
      ElementEmitter(context).emit(v, output);
    }

    output.write(' }');

    if (value.else_.isNotEmpty) {
      output.write(' else { ');

      for (final v in value.else_) {
        ElementEmitter(context).emit(v, output);
      }

      output.write(' }');
    }

    return output;
  }
}
