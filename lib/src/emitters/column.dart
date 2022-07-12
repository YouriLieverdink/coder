part of emitter;

/// {@template column_emitter}
/// Transforms the [Column] element into Dart source code.
/// {@endtemplate}
class ColumnEmitter extends Emitter<Column> {
  /// {@macro column_emitter}
  const ColumnEmitter(super.context);

  @override
  StringSink emit(
    Column value, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    for (final v in value.elements) {
      ElementEmitter(context).emit(v, output);

      output.write('\n');
    }

    return output;
  }
}
