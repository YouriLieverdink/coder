part of emitter;

/// {@template class_emitter}
/// Transforms the [Class] element into Dart source code.
/// {@endtemplate}
class ClassEmitter extends Emitter<Class> {
  /// {@macro class_emitter}
  const ClassEmitter(super.context);

  @override
  StringSink emit(
    Class value, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    if (value.isAbstract) {
      output.write('abstract ');
    }

    output.write('class ${value.name} ');

    if (value.extends_ != null) {
      output.write(' extends ');

      ReferenceEmitter(context).emit(value.extends_!, output);
    }

    if (value.with_.isNotEmpty) {
      output.write(' with ');

      for (final v in value.with_) {
        ReferenceEmitter(context).emit(v, output);

        if (v != value.with_.last) {
          output.write(', ');
        }
      }
    }

    if (value.implements.isNotEmpty) {
      output.write(' implements ');

      for (final v in value.implements) {
        ReferenceEmitter(context).emit(v, output);

        if (v != value.implements.last) {
          output.write(', ');
        }
      }
    }

    output.write(' { ');

    for (final v in value.constructors) {
      ConstructorEmitter(context, value).emit(v, output);
    }

    for (final v in value.fields) {
      FieldEmitter(context).emit(v, output);
    }

    for (final v in value.methods) {
      MethodEmitter(context).emit(v, output);
    }

    output.write(' } ');

    return output;
  }
}
