part of emitter;

/// {@template element_emitter}
/// Transforms a [Element] into Dart source code.
/// {@endtemplate}
class ElementEmitter extends Emitter<Element> {
  /// {@macro element_emitter}
  const ElementEmitter(super.context);

  @override
  StringSink emit(
    Element value, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    if (value is Binary) {
      BinaryEmitter(context).emit(value, output);
    }
    if (value is Class) {
      ClassEmitter(context).emit(value, output);
    } //
    else if (value is Constructor) {
      throw UnsupportedError(
        'Emitting a [Constructor] element is not possible via the abstract '
        '[SpecEmitter] due to the fact that a [Constructor] emitter should '
        'receive an instance of its parent [Class] in order to emit.',
      );
    } //
    else if (value is Enum) {
      EnumEmitter(context).emit(value, output);
    } //
    else if (value is Extension) {
      ExtensionEmitter(context).emit(value, output);
    } //
    else if (value is Field) {
      FieldEmitter(context).emit(value, output);
    } //
    else if (value is For) {
      ForEmitter(context).emit(value, output);
    } //
    else if (value is If) {
      IfEmitter(context).emit(value, output);
    } //
    else if (value is Literal) {
      LiteralEmitter(context).emit(value, output);
    } //
    else if (value is Method) {
      MethodEmitter(context).emit(value, output);
    } //
    else if (value is Parameter) {
      ParameterEmitter(context).emit(value, output);
    } //
    else if (value is Reference) {
      ReferenceEmitter(context).emit(value, output);
    } //
    else if (value is Static) {
      StaticEmitter(context).emit(value, output);
    } //
    else if (value is While) {
      WhileEmitter(context).emit(value, output);
    } //

    return output;
  }
}
