part of emitter;

/// {@template switch_emitter}
/// Transforms the [Switch] into Dart source code.
/// {@endtemplate}
class SwitchEmitter extends Emitter<Switch> {
  /// {@macro switch_emitter}
  const SwitchEmitter(super.context);

  @override
  StringSink emit(
    Switch value, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    output.write('switch (');

    ElementEmitter(context).emit(value.condition, output);

    output.write(') { ');

    for (final v in value.cases) {
      SwitchCaseEmitter(context).emit(v, output);
    }

    output.write(' }');

    return output;
  }
}

/// {@template switch_case_emitter}
/// Transforms the [SwitchCase] into Dart source code.
/// {@endtemplate}
class SwitchCaseEmitter extends Emitter<SwitchCase> {
  /// {@macro switch_case_emitter}
  const SwitchCaseEmitter(super.context);

  @override
  StringSink emit(
    SwitchCase value, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    output.write('case ');

    ElementEmitter(context).emit(value.condition, output);

    output.write(': ');

    if (value.body != null) {
      ElementEmitter(context).emit(value.body!, output);
    }

    return output;
  }
}
