part of emitter;

/// {@template enum_emitter}
/// Transforms the [Enum] element into Dart source code.
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

    output.write(' enum ${element.name} { ');

    for (final v in element.values) {
      EnumValueEmitter(context).emit(v, output);

      if (v != element.values.last || context.useTraillingCommas) {
        output.write(' , ');
      }
    }

    output.write(' } ');

    return output;
  }
}

/// {@template enum_value_emitter}
/// Transforms the [EnumValue] element into Dart source code.
/// {@endtemple}
class EnumValueEmitter extends Emitter<EnumValue> {
  /// {@macro enum_value_emitter}
  const EnumValueEmitter(super.context);

  @override
  StringSink emit(
    EnumValue element, [
    StringSink? output,
  ]) {
    //
    output ??= StringBuffer();

    output.write(' ${element.name} ');

    return output;
  }
}
