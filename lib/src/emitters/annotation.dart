part of emitter;

/// {@template annotation_emitter}
/// Emits the [Annotation] configuration into Dart source code.
/// {@endtemplate}
class AnnotationEmitter extends Emitter<Annotation> {
  /// {@macro annotation_emitter}
  const AnnotationEmitter(super.context);

  @override
  StringSink emit(
    Annotation element, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    output.write('@');

    ReferenceEmitter(context).emit(element.type, output);

    if (element.arguments.isNotEmpty) {
      output.write('(');

      for (final v in element.arguments) {
        ElementEmitter(context).emit(v, output);
      }

      output.write(')');
    }

    return output;
  }
}
