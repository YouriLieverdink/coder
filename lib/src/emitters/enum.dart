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

    for (final v in element.docs) {
      DocsEmitter(context).emit(v, output);

      output.write('\n');
    }

    for (final v in element.annotations) {
      AnnotationEmitter(context).emit(v, output);

      output.write('\n');
    }

    output.write(' enum ${element.name} { ');

    var index = 0;

    for (final v in element.values) {
      EnumValueEmitter(context).emit(v, output);

      index++;

      if (index < element.values.length) {
        output.write(' , ');
      } //
      else {
        if (element.constructors.isNotEmpty) {
          output.write(' ; ');
        }
      }
    }

    for (final v in element.constructors) {
      final class_ = Class(name: element.name);

      ConstructorEmitter(context, class_).emit(v, output);
    }

    for (final v in element.fields) {
      FieldEmitter(context).emit(v, output);
    }

    for (final v in element.methods) {
      MethodEmitter(context).emit(v, output);
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

    for (final v in element.docs) {
      DocsEmitter(context).emit(v, output);

      output.write('\n');
    }

    for (final v in element.annotations) {
      AnnotationEmitter(context).emit(v, output);

      output.write('\n');
    }

    output.write(element.name);

    if (element.arguments.isNotEmpty) {
      output.write('(');

      var index = 0;

      for (final v in element.arguments) {
        ElementEmitter(context).emit(v, output);

        index++;

        if (index < element.arguments.length) {
          output.write(', ');
        }
      }

      output.write(')');
    }

    return output;
  }
}
