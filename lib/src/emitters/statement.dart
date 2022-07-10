part of emitter;

/// {@template statement_emitter}
///
/// {@endtemplate}
class StatementEmitter extends Emitter<Statement> {
  /// {@macro statement_emitter}
  const StatementEmitter(super.context);

  @override
  StringSink emit(
    Statement value, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    output.write(value.value);

    return output;
  }
}
