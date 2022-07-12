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

    if (value is Binary) {
      BinaryEmitter(context).emit(value, output);
    } //
    else if (value is Literal) {
      LiteralEmitter(context).emit(value, output);
    } //
    else if (value is Static) {
      StaticEmitter(context).emit(value, output);
    }

    return output;
  }
}

/// {@template binary_statement_emitter}
/// Transforms the [Binary] into Dart source code.
/// {@endtemplate}
class BinaryEmitter extends Emitter<Binary> {
  /// {@macro binary_statement}
  const BinaryEmitter(super.context);

  @override
  StringSink emit(
    Binary value, [
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
/// Transforms the [Literal] into Dart source code.
/// {@endtemplate}
class LiteralEmitter extends Emitter<Literal> {
  /// {@macro literal_statement_emitter}
  const LiteralEmitter(super.context);

  @override
  StringSink emit(
    Literal value, [
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
