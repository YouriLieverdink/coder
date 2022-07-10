part of emitter;

/// {@template statement_emitter}
/// Transforms the [Statement] into Dart source code.
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

    if (value is StaticStatement) {
      StaticStatementEmitter(context).emit(value, output);
    }

    return output;
  }
}

/// {@template static_statement_emitter}
/// Transforms the [StaticStatement] into Dart source code.
/// {@endtemplate}
class StaticStatementEmitter extends Emitter<StaticStatement> {
  /// {@macro static_statement_emitter}
  StaticStatementEmitter(super.context);

  @override
  StringSink emit(
    StaticStatement value, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    output.write(value.value);

    return output;
  }
}
