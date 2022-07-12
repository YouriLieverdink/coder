part of emitter;

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
