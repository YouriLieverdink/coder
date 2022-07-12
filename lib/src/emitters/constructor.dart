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
    Constructor value, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    if (value.isConst) {
      output.write(' const ');
    }

    if (value.isFactory) {
      output.write(' factory ');
    }

    output.write(class_.name);

    if (value.name != null) {
      output.write('.${value.name}');
    }

    output.write('(');

    ParameterListEmitter(context).emit(value.parameters, output);

    output.write(')');

    if (!value.isConst) {
      output.write(' {');

      BlockEmitter(context).emit(value.body, output);

      output.write(' }');
    } //
    else {
      output.write(';');
    }

    return output;
  }
}
