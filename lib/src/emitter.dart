library emitter;

import 'package:orchestrator/orchestrator.dart';

part './emitters/class.dart';
part './emitters/column.dart';
part './emitters/constructor.dart';
part './emitters/directive.dart';
part './emitters/element.dart';
part './emitters/enum.dart';
part './emitters/extension.dart';
part './emitters/field.dart';
part './emitters/for.dart';
part './emitters/if.dart';
part './emitters/invoke.dart';
part './emitters/literal.dart';
part './emitters/method.dart';
part './emitters/mixin.dart';
part './emitters/parameter.dart';
part './emitters/reference.dart';
part './emitters/row.dart';
part './emitters/static.dart';
part './emitters/switch.dart';
part './emitters/try_catch.dart';
part './emitters/while.dart';

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

  /// Emits [element] as valid Dart code into [output].
  StringSink emit(
    T element, [
    StringSink? output,
  ]);
}
