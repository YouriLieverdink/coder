part of emitter;

/// {@template mixin_emitter}
/// Emits the [Mixin] configuration into Dart source code.
/// {@endtemplate}
class MixinEmitter extends Emitter<Mixin> {
  /// {@macro mixin_emitter}
  const MixinEmitter(super.context);

  @override
  StringSink emit(
    Mixin value, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    output
      ..write('mixin ')
      ..write(value.name);

    if (value.on != null) {
      output.write(' on ');

      ReferenceEmitter(context).emit(value.on!, output);
    }

    output.write(' { ');

    for (final v in value.fields) {
      FieldEmitter(context).emit(v, output);
    }

    for (final v in value.methods) {
      MethodEmitter(context).emit(v, output);
    }

    output.write(' }');

    return output;
  }
}
