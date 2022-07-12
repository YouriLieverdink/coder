part of emitter;

/// {@template while_emitter}
/// Transforms the [While] into Dart source code.
/// {@endtemplate}
class WhileEmitter extends Emitter<While> {
  /// {@macro while_emitter}
  const WhileEmitter(super.context);

  void condition(
    While value,
    StringSink output,
  ) {
    output.write(' while (');

    ElementEmitter(context).emit(value.condition, output);

    output.write(')');
  }

  void body(
    While value,
    StringSink output,
  ) {
    output.write(' { ');

    for (final v in value.body) {
      ElementEmitter(context).emit(v, output);
    }

    output.write(' }');
  }

  @override
  StringSink emit(
    While value, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    switch (value.kind) {
      case WhileKind.while_:
        condition(value, output);
        body(value, output);
        break;

      case WhileKind.doWhile:
        output.write('do ');

        body(value, output);
        condition(value, output);

        output.write(';');
        break;
    }

    return output;
  }
}
