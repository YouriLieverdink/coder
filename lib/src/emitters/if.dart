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

    BlockEmitter(context).emit(value.then, output);

    output.write(' }');

    if (value.else_.elements.isNotEmpty) {
      output.write(' else { ');

      BlockEmitter(context).emit(value.else_, output);

      output.write(' }');
    }

    return output;
  }
}
