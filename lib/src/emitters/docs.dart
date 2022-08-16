part of emitter;

/// {@template docs_emitter}
/// Emits the [Docs] configuration into Dart source code.
/// {@endtemplate}
class DocsEmitter extends Emitter<Docs> {
  /// {@macro docs}
  const DocsEmitter(super.context);

  int line(
    String value,
  ) {
    return value.length - value.lastIndexOf('\n') - 1;
  }

  @override
  StringSink emit(
    Docs element, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    final value = StringBuffer();
    final words = element.value.split(' ');

    for (final v in words) {
      // When the next word exceeds the limit, we add a line break.
      if (line('$value') + v.length > 76) {
        value.write('\n/// ');
      }

      value.write(v);

      if (v != words.last) {
        value.write(' ');
      }
    }

    output
      ..write('/// ')
      ..write(value);

    return output;
  }
}
