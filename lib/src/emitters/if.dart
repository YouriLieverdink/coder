part of emitter;

/// {@template if_else_emitter}
/// Transforms the [IfElse] into Dart source code.
/// {@endtemplate}
class IfElseEmitter extends Emitter<IfElse> {
  /// {@macro if_else_emitter}
  const IfElseEmitter(super.context);

  @override
  StringSink emit(
    IfElse value, [
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
