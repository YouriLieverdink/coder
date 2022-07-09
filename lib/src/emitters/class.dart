part of emitter;

/// {@template class_emitter}
///
/// {@endtemplate}
class ClassEmitter extends Emitter<Class> {
  /// {@macro class_emitter}
  const ClassEmitter(super.context);

  @override
  StringSink emit(
    Class element, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    output.write(' class ${element.name} ');

    if (element.extends_ != null) {
      output.write(' extends ');

      ReferenceEmitter(context).emit(element.extends_!, output);
    }

    output.write(' { ');

    for (final v in element.constructors) {
      ConstructorEmitter(context, element).emit(v, output);
    }

    for (final v in element.fields) {
      FieldEmitter(context).emit(v, output);
    }

    output.write(' } ');

    return output;
  }
}
