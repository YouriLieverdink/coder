part of emitter;

/// {@template mixin_emitter}
/// Emits the [Mixin] configuration into Dart source code.
/// {@endtemplate}
class MixinEmitter extends Emitter<Mixin> {
  /// {@macro mixin_emitter}
  const MixinEmitter(super.context);

  @override
  StringSink emit(
    Mixin element, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    for (final v in element.docs) {
      DocsEmitter(context).emit(v, output);

      output.write('\n');
    }

    output
      ..write('mixin ')
      ..write(element.name);

    if (element.on != null) {
      output.write(' on ');

      ReferenceEmitter(context).emit(element.on!, output);
    }

    output.write(' { ');

    for (final v in element.fields) {
      FieldEmitter(context).emit(v, output);

      output.writeln('\n');
    }

    for (final v in element.methods) {
      MethodEmitter(context).emit(v, output);

      output.writeln('\n');
    }

    output.write(' }');

    return output;
  }
}
