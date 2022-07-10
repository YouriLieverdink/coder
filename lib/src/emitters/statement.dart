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

    if (value is BinaryStatement) {
      BinaryStatementEmitter(context).emit(value, output);
    } //
    else if (value is LiteralStatement) {
      LiteralStatementEmitter(context).emit(value, output);
    } //
    else if (value is StaticStatement) {
      StaticStatementEmitter(context).emit(value, output);
    }

    return output;
  }
}

/// {@template binary_statement_emitter}
/// Transforms the [BinaryStatement] into Dart source code.
/// {@endtemplate}
class BinaryStatementEmitter extends Emitter<BinaryStatement> {
  /// {@macro binary_statement}
  const BinaryStatementEmitter(super.context);

  @override
  StringSink emit(
    BinaryStatement value, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    StatementEmitter(context).emit(value.left, output);

    output.write(' ${value.operator} ');

    StatementEmitter(context).emit(value.right, output);

    return output;
  }
}

/// {@template literal_statement_emitter}
/// Transforms the [LiteralStatement] into Dart source code.
/// {@endtemplate}
class LiteralStatementEmitter extends Emitter<LiteralStatement> {
  /// {@macro literal_statement_emitter}
  const LiteralStatementEmitter(super.context);

  @override
  StringSink emit(
    LiteralStatement value, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    if (value.value is String) {
      output.write("'${value.value}'");
    } //
    else {
      output.write(value.value);
    }

    return output;
  }
}

/// {@template static_statement_emitter}
/// Transforms the [StaticStatement] into Dart source code.
/// {@endtemplate}
class StaticStatementEmitter extends Emitter<StaticStatement> {
  /// {@macro static_statement_emitter}
  const StaticStatementEmitter(super.context);

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
