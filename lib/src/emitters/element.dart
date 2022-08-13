part of emitter;

/// {@template element_emitter}
/// Transforms a [Element] into Dart source code.
/// {@endtemplate}
class ElementEmitter extends Emitter<Element> {
  /// {@macro element_emitter}
  const ElementEmitter(super.context);

  @override
  StringSink emit(
    Element element, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    if (element is Class) {
      ClassEmitter(context).emit(element, output);
    } //
    else if (element is Column) {
      ColumnEmitter(context).emit(element, output);
    } //
    else if (element is Constructor) {
      throw UnsupportedError(
        'Emitting a [Constructor] element is not possible via the abstract '
        '[SpecEmitter] due to the fact that a [Constructor] emitter should '
        'receive an instance of its parent [Class] in order to emit.',
      );
    } //
    else if (element is Directive) {
      DirectiveEmitter(context).emit(element, output);
    } //
    else if (element is Enum) {
      EnumEmitter(context).emit(element, output);
    } //
    else if (element is Extension) {
      ExtensionEmitter(context).emit(element, output);
    } //
    else if (element is Field) {
      FieldEmitter(context).emit(element, output);
    } //
    else if (element is If) {
      IfEmitter(context).emit(element, output);
    } //
    else if (element is Invoke) {
      InvokeEmitter(context).emit(element, output);
    } //
    else if (element is Library) {
      LibraryEmitter(context).emit(element, output);
    } //
    else if (element is Literal) {
      LiteralEmitter(context).emit(element, output);
    } //
    else if (element is Loop) {
      LoopEmitter(context).emit(element, output);
    } //
    else if (element is Method) {
      MethodEmitter(context).emit(element, output);
    } //
    else if (element is Mixin) {
      MixinEmitter(context).emit(element, output);
    } //
    else if (element is Parameter) {
      ParameterEmitter(context).emit(element, output);
    } //
    else if (element is Reference) {
      ReferenceEmitter(context).emit(element, output);
    } //
    else if (element is Row) {
      RowEmitter(context).emit(element, output);
    } //
    else if (element is Static) {
      StaticEmitter(context).emit(element, output);
    } //
    else if (element is Switch) {
      SwitchEmitter(context).emit(element, output);
    } //
    else if (element is TryCatch) {
      TryCatchEmitter(context).emit(element, output);
    } //

    return output;
  }
}
