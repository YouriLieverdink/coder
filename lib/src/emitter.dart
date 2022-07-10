library emitter;

import 'package:orchestrator/orchestrator.dart';

part './emitters/class.dart';
part './emitters/constructor.dart';
part './emitters/enum.dart';
part './emitters/extension.dart';
part './emitters/field.dart';
part './emitters/method.dart';
part './emitters/parameter.dart';
part './emitters/reference.dart';
part './emitters/statement.dart';

/// {@template emitter}
/// The [Emitter] is used to transform any object [T] into an output.
///
/// Every emitter defined receives a [Context] object from it's creator which
/// contains rules which the [Emitter] must follow. An example of a rule is the
/// use of trailling commas.
/// {@endtemplate}
abstract class Emitter<T> {
  /// {@macro emitter}
  const Emitter(this.context);

  final Context context;

  /// Emits [value] as valid Dart code into [output].
  StringSink emit(
    T value, [
    StringSink? output,
  ]);
}
