part of emitter;

/// {@template constructor_emitter}
///
/// {@endtemplate}
class ConstructorEmitter extends Emitter<Constructor> {
  /// {@macro constructor_emitter}
  ConstructorEmitter(
    super.context, {
    required this.parent,
  });

  final Class parent;

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

    output.write(parent.name);

    if (element.name != null) {
      output.write('.${element.name}');
    }

    output.write('()');

    if (!element.isConst) {
      output.write('{}');
    } //
    else {
      output.write(';');
    }

    return output;
  }
}
