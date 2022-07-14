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

    if (value is LiteralBool) {
      LiteralBoolEmitter(context).emit(value, output);
    } //
    else if (value is LiteralList) {
      LiteralListEmitter(context).emit(value, output);
    } //
    else if (value is LiteralNull) {
      LiteralNullEmitter(context).emit(value, output);
    } //
    else if (value is LiteralNum) {
      LiteralNumEmitter(context).emit(value, output);
    } //
    else if (value is LiteralString) {
      LiteralStringEmitter(context).emit(value, output);
    }

    return output;
  }
}

/// {@template literal_bool_emitter}
/// Transforms the [LiteralBool] into Dart source code.
/// {@endtemplate}
class LiteralBoolEmitter extends Emitter<LiteralBool> {
  /// {@macro literal_bool_emitter}
  const LiteralBoolEmitter(super.context);

  @override
  StringSink emit(
    LiteralBool value, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    output.write(value.value);

    return output;
  }
}

/// {@template literal_list_emitter}
/// Transforms the [LiteralList] into Dart source code.
/// {@endtemplate}
class LiteralListEmitter extends Emitter<LiteralList> {
  /// {@macro literal_list_emitter}
  const LiteralListEmitter(super.context);

  @override
  StringSink emit(
    LiteralList value, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    output.write('[');

    for (final v in value.value) {
      if (v is Element) {
        ElementEmitter(context).emit(v, output);
      } //
      else {
        LiteralEmitter(context).emit(literal(v), output);
      }

      if (v != value.value.last) {
        output.write(', ');
      }
    }

    output.write(']');

    return output;
  }
}

/// {@template literal_null_emitter}
/// Transforms the [LiteralNull] into Dart source code.
/// {@endtemplate}
class LiteralNullEmitter extends Emitter<LiteralNull> {
  /// {@macro literal_null_emitter}
  const LiteralNullEmitter(super.context);

  @override
  StringSink emit(
    LiteralNull value, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    output.write('null');

    return output;
  }
}

/// {@template literal_num_emitter}
/// Transforms the [LiteralNum] into Dart source code.
/// {@endtemplate}
class LiteralNumEmitter extends Emitter<LiteralNum> {
  /// {@macro literal_num_emitter}
  const LiteralNumEmitter(super.context);

  @override
  StringSink emit(
    LiteralNum value, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    output.write(value.value);

    return output;
  }
}

/// {@template literal_string_emitter}
/// Transforms the [LiteralString] into Dart source code.
/// {@endtemplate}
class LiteralStringEmitter extends Emitter<LiteralString> {
  /// {@macro literal_string_emitter}
  const LiteralStringEmitter(super.context);

  @override
  StringSink emit(
    LiteralString value, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    output.write("'${value.value}'");

    return output;
  }
}
