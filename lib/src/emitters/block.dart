part of emitter;

/// {@template block_emitter}
/// Transforms the [Block] element into Dart source code.
/// {@endtemplate}
class BlockEmitter extends Emitter<Block> {
  /// {@macro block_emitter}
  const BlockEmitter(super.context);

  @override
  StringSink emit(
    Block value, [
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
