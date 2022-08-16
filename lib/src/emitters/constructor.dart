part of emitter;

/// {@template constructor_emitter}
/// Transforms the [Constructor] element into Dart source code.
/// {@endtemplate}
class ConstructorEmitter extends Emitter<Constructor> {
  /// {@macro constructor_emitter}
  const ConstructorEmitter(super.context, this.class_);

  final Class class_;

  @override
  StringSink emit(
    Constructor element, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    for (final v in element.docs) {
      DocsEmitter(context).emit(v, output);

      output.write('\n');
    }

    if (element.isConst) {
      output.write(' const ');
    }

    if (element.isFactory) {
      output.write(' factory ');
    }

    output.write(class_.name);

    if (element.name != null) {
      output.write('.${element.name}');
    }

    output.write('(');

    ParameterListEmitter(context).emit(element.parameters, output);

    output.write(')');

    if (!element.isConst) {
      output.write(' {');

      if (element.body != null) {
        ElementEmitter(context).emit(element.body!, output);
      }

      output.write(' }');
    } //
    else {
      output.write(';');
    }

    return output;
  }
}
