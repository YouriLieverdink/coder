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

    ElementEmitter(context).emit(value.try_, output);

    output.write(' } catch (e) { ');

    if (value.catch_ != null) {
      ElementEmitter(context).emit(value.catch_!, output);
    }

    output.write(' }');

    if (value.finally_ != null) {
      output.write(' finally { ');

      ElementEmitter(context).emit(value.finally_!, output);

      output.write(' }');
    }

    return output;
  }
}
