part of emitter;

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

    ElementEmitter(context).emit(value.left, output);

    output.write(' ${value.operator} ');

    ElementEmitter(context).emit(value.right, output);

    return output;
  }
}
