library emitter;

import 'package:coder/coder.dart';

part './emitters/class.dart';
part './emitters/constructor.dart';
part './emitters/enum.dart';
part './emitters/field.dart';
part './emitters/reference.dart';

/// {@template emitter}
///
/// {@endtemplate}
abstract class Emitter<T extends Element> {
  /// {@macro emitter}
  const Emitter(
    this.context,
  );

  final Context context;

  /// Emits [element] as valid Dart code into [output].
  StringSink emit(
    T element, [
    StringSink? output,
  ]);
}
