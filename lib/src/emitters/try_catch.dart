part of emitter;

/// {@template try_catch_emitter}
/// Transforms the [TryCatch] into Dart source code.
/// {@endtemplate}
class TryCatchEmitter extends Emitter<TryCatch> {
  /// {@macro try_catch_emitter}
  const TryCatchEmitter(super.context);

  @override
  StringSink emit(
    TryCatch element, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    output.write('try { ');

    ElementEmitter(context).emit(element.try_, output);

    output.write(' } catch (e) { ');

    if (element.catch_ != null) {
      ElementEmitter(context).emit(element.catch_!, output);
    }

    output.write(' }');

    if (element.finally_ != null) {
      output.write(' finally { ');

      ElementEmitter(context).emit(element.finally_!, output);

      output.write(' }');
    }

    return output;
  }
}
