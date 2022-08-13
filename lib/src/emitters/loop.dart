part of emitter;

/// {@template loop_emitter}
/// Emits the [Loop] configuration into Dart source code.
/// {@endtemplate}
class LoopEmitter extends Emitter<Loop> {
  /// {@macro loop_emitter}
  const LoopEmitter(super.context);

  void condition(
    Loop element,
    StringSink output,
  ) {
    switch (element.kind) {
      case LoopKind.for_:
        output.write(' for (');
        break;

      case LoopKind.while_:
      case LoopKind.doWhile:
        output.write(' while (');
        break;
    }

    ElementEmitter(context).emit(element.clause, output);

    output.write(')');
  }

  void body(
    Loop element,
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
    Loop element, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    switch (element.kind) {
      case LoopKind.for_:
      case LoopKind.while_:
        condition(element, output);
        body(element, output);
        break;

      case LoopKind.doWhile:
        output.write('do');

        body(element, output);
        condition(element, output);

        output.write(';');
        break;
    }

    return output;
  }
}
