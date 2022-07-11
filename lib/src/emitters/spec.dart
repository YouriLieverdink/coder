part of emitter;

/// {@template spec_emitter}
/// Transforms a [Spec] into Dart source code.
/// {@endtemplate}
class SpecEmitter extends Emitter<Spec> {
  /// {@macro spec_emitter}
  const SpecEmitter(super.context);

  @override
  StringSink emit(
    Spec value, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    if (value is Class) {
      return ClassEmitter(context).emit(value, output);
    } //
    else if (value is Constructor) {
      throw UnsupportedError(
        'Emitting a [Constructor] element is not possible via the abstract '
        '[SpecEmitter] due to the fact that a [Constructor] emitter should '
        'receive an instance of its parent [Class] in order to emit.',
      );
    } //
    else if (value is Enum) {
      return EnumEmitter(context).emit(value, output);
    } //
    else if (value is Extension) {
      return ExtensionEmitter(context).emit(value, output);
    } //
    else if (value is Field) {
      return FieldEmitter(context).emit(value, output);
    } //
    else if (value is Method) {
      return MethodEmitter(context).emit(value, output);
    } //
    else if (value is Parameter) {
      return ParameterEmitter(context).emit(value, output);
    } //
    else if (value is Reference) {
      return ReferenceEmitter(context).emit(value, output);
    } //
    else if (value is Statement) {
      return StatementEmitter(context).emit(value, output);
    }

    return output;
  }
}
