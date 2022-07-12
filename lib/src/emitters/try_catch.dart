part of emitter;

/// {@template try_catch_emitter}
/// Transforms the [TryCatch] into Dart source code.
/// {@endtemplate}
class TryCatchEmitter extends Emitter<TryCatch> {
  /// {@macro try_catch_emitter}
  const TryCatchEmitter(super.context);

  @override
  StringSink emit(
    TryCatch value, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    output.write('try { ');

    for (final v in value.try_) {
      ElementEmitter(context).emit(v, output);
    }

    output.write(' } catch (e) { ');

    for (final v in value.catch_) {
      ElementEmitter(context).emit(v, output);
    }

    output.write(' }');

    if (value.finally_.isNotEmpty) {
      output.write(' finally { ');

      for (final v in value.finally_) {
        ElementEmitter(context).emit(v, output);
      }

      output.write(' }');
    }

    return output;
  }
}
