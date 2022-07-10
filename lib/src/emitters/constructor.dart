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

      for (final v in element.body) {
        StatementEmitter(context).emit(v, output);
      }

      output.write(' }');
    } //
    else {
      output.write(';');
    }

    return output;
  }
}
