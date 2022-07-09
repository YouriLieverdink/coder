part of emitter;

/// {@template constructor_emitter}
///
/// {@endtemplate}
class ConstructorEmitter extends Emitter<Constructor> {
  /// {@macro constructor_emitter}
  ConstructorEmitter(super.context, this.class_);

  final Class class_;

  @override
  StringSink emit(
    Constructor element, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    if (element.isConst) {
      output.write('const ');
    }

    if (element.isFactory) {
      output.write('factory ');
    }

    output.write(class_.name);

    if (element.name != null) {
      output.write('.${element.name}');
    }

    output.write('(');

    ParameterListEmitter(context).emit(element.parameters, output);

    output.write(')');

    if (!element.isConst) {
      output //
        ..write('{')
        ..write('}');
    } //
    else {
      output.write(';');
    }

    return output;
  }
}
