part of emitter;

/// {@template while_emitter}
/// Transforms the [While] into Dart source code.
/// {@endtemplate}
class WhileEmitter extends Emitter<While> {
  /// {@macro while_emitter}
  const WhileEmitter(super.context);

  void condition(
    While element,
    StringSink output,
  ) {
    output.write(' while (');

    ElementEmitter(context).emit(element.condition, output);

    output.write(')');
  }

  void body(
    While element,
    StringSink output,
  ) {
    output.write(' { ');

    if (element.body != null) {
      ElementEmitter(context).emit(element.body!, output);
    }

    output.write(' }');
  }

  @override
  StringSink emit(
    While element, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    switch (element.kind) {
      case WhileKind.while_:
        condition(element, output);
        body(element, output);
        break;

      case WhileKind.doWhile:
        output.write('do ');

        body(element, output);
        condition(element, output);

        output.write(';');
        break;
    }

    return output;
  }
}
