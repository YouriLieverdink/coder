part of emitter;

/// {@template static_statement_emitter}
/// Transforms the [Static] into Dart source code.
/// {@endtemplate}
class StaticEmitter extends Emitter<Static> {
  /// {@macro static_statement_emitter}
  const StaticEmitter(super.context);

  @override
  StringSink emit(
    Static value, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    output.write(value.value);

    return output;
  }
}
