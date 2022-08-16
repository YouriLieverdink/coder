part of emitter;

/// {@template class_emitter}
/// Transforms the [Class] element into Dart source code.
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

    for (final v in element.docs) {
      DocsEmitter(context).emit(v, output);

      output.write('\n');
    }

    if (element.isAbstract) {
      output.write('abstract ');
    }

    output.write('class ${element.name} ');

    if (element.extends_ != null) {
      output.write(' extends ');

      ReferenceEmitter(context).emit(element.extends_!, output);
    }

    if (element.with_.isNotEmpty) {
      output.write(' with ');

      for (final v in element.with_) {
        ReferenceEmitter(context).emit(v, output);

        if (v != element.with_.last) {
          output.write(', ');
        }
      }
    }

    if (element.implements.isNotEmpty) {
      output.write(' implements ');

      for (final v in element.implements) {
        ReferenceEmitter(context).emit(v, output);

        if (v != element.implements.last) {
          output.write(', ');
        }
      }
    }

    output.write(' { ');

    for (final v in element.constructors) {
      ConstructorEmitter(context, element).emit(v, output);

      output.writeln('\n');
    }

    for (final v in element.fields) {
      FieldEmitter(context).emit(v, output);

      output.writeln('\n');
    }

    for (final v in element.methods) {
      MethodEmitter(context).emit(v, output);

      output.writeln('\n');
    }

    output.write(' } ');

    return output;
  }
}
