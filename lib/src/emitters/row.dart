part of emitter;

/// {@template row_emitter}
/// Transforms the [Row] element into Dart source code.
/// {@endtemplate}
class RowEmitter extends Emitter<Row> {
  /// {@macro row_emitter}
  const RowEmitter(super.context);

  @override
  StringSink emit(
    Row element, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    for (final v in element.elements) {
      ElementEmitter(context).emit(v, output);
    }

    return output;
  }
}
