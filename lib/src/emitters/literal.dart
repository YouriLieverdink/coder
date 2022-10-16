part of emitter;

/// {@template literal_statement_emitter}
/// Transforms the [Literal] into Dart source code.
/// {@endtemplate}
class LiteralEmitter extends Emitter<Literal> {
  /// {@macro literal_statement_emitter}
  const LiteralEmitter(super.context);

  @override
  StringSink emit(
    Literal element, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    if (element is LiteralBool) {
      LiteralBoolEmitter(context).emit(element, output);
    } //
    else if (element is LiteralList) {
      LiteralListEmitter(context).emit(element, output);
    } //
    else if (element is LiteralMap) {
      LiteralMapEmitter(context).emit(element, output);
    } //
    else if (element is LiteralNull) {
      LiteralNullEmitter(context).emit(element, output);
    } //
    else if (element is LiteralNum) {
      LiteralNumEmitter(context).emit(element, output);
    } //
    else if (element is LiteralSet) {
      LiteralSetEmitter(context).emit(element, output);
    } //
    else if (element is LiteralString) {
      LiteralStringEmitter(context).emit(element, output);
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
    LiteralBool element, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    output.write(element.value);

    return output;
  }
}

/// {@template literal_list_emitter}
/// Transforms the [LiteralList] into Dart source code.
/// {@endtemplate}
class LiteralListEmitter extends Emitter<LiteralList> {
  /// {@macro literal_list_emitter}
  const LiteralListEmitter(super.context);

  ///
  StringSink emitDynamic(
    dynamic element, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    if (element is Element) {
      return ElementEmitter(context).emit(element, output);
    }

    final literal = Literal.of(element);

    return LiteralEmitter(context).emit(literal, output);
  }

  @override
  StringSink emit(
    LiteralList element, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    output.write('[');

    var index = 0;

    for (final v in element.value) {
      emitDynamic(v, output);

      index++;

      if (index < element.value.length) {
        output.write(', ');
      }
    }

    output.write(']');

    return output;
  }
}

/// {@template literal_map_emitter}
/// Transforms the [LiteralMap] into Dart source code.
/// {@endtemplate}
class LiteralMapEmitter extends Emitter<LiteralMap> {
  /// {@macro literal_map_emitter}
  const LiteralMapEmitter(super.context);

  ///
  StringSink emitDynamic(
    dynamic element, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    if (element is Element) {
      return ElementEmitter(context).emit(element, output);
    }

    final literal = Literal.of(element);

    return LiteralEmitter(context).emit(literal, output);
  }

  @override
  StringSink emit(
    LiteralMap element, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    output.write('{ ');

    var index = 0;

    for (final v in element.value.entries) {
      emitDynamic(v.key, output);

      output.write(': ');

      emitDynamic(v.value, output);

      index++;

      if (index < element.value.length) {
        output.write(', ');
      }
    }

    output.write(' }');

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
    LiteralNull element, [
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
    LiteralNum element, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    output.write(element.value);

    return output;
  }
}

/// {@template literal_set_emitter}
/// Transforms the [LiteralSet] into Dart source code.
/// {@endtemplate}
class LiteralSetEmitter extends Emitter<LiteralSet> {
  /// {@macro literal_set_emitter}
  const LiteralSetEmitter(super.context);

  ///
  StringSink emitDynamic(
    dynamic element, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    if (element is Element) {
      return ElementEmitter(context).emit(element, output);
    }

    final literal = Literal.of(element);

    return LiteralEmitter(context).emit(literal, output);
  }

  @override
  StringSink emit(
    LiteralSet element, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    output.write('{');

    var index = 0;

    for (final v in element.value) {
      emitDynamic(v, output);

      index++;

      if (index < element.value.length) {
        output.write(', ');
      }
    }

    output.write('}');

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
    LiteralString element, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    output.write("'${element.value}'");

    return output;
  }
}
