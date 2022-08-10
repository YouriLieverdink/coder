part of emitter;

/// {@template directive_emitter}
/// Emits the [Directive] configuration into Dart source code.
/// {@endtemplate}
class DirectiveEmitter extends Emitter<Directive> {
  /// {@macro directive_emitter}
  const DirectiveEmitter(super.context);

  @override
  StringSink emit(
    Directive value, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    switch (value.kind) {
      case DirectiveKind.import:
        output.write('import ');
        break;

      case DirectiveKind.export:
        output.write('export ');
        break;

      case DirectiveKind.part:
        output.write('part ');
        break;

      case DirectiveKind.partOf:
        output.write('part of ');
        break;
    }

    LiteralEmitter(context).emit(Literal.of(value.url), output);

    output.write(';');

    return output;
  }
}
