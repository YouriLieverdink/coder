part of emitter;

/// {@template enum_emitter}
///
/// {@endtemplate}
class EnumEmitter extends Emitter<Enum> {
  /// {@macro enum_emitter}
  const EnumEmitter(super.context);

  @override
  StringSink emit(
    Enum element, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    output //
      ..write('enum ')
      ..write('${element.name} ')
      ..write('{');

    for (final v in element.values) {
      EnumValueEmitter(context).emit(v, output);

      if (v != element.values.last) {
        output.write(',');
      }
    }

    output.write('}');

    return output;
  }
}

/// {@template enum_value_emitter}
///
/// {@endtemple}
class EnumValueEmitter extends Emitter<EnumValue> {
  /// {@macro enum_value_emitter}
  EnumValueEmitter(super.context);

  @override
  StringSink emit(
    EnumValue element, [
    StringSink? output,
  ]) {
    //
    output ??= StringBuffer();

    output.write(element.name);

    return output;
  }
}
