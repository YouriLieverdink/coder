library emitter;

import 'package:coder/coder.dart';

part './emitters/class.dart';
part './emitters/constructor.dart';
part './emitters/enum.dart';
part './emitters/field.dart';
part './emitters/parameter.dart';
part './emitters/reference.dart';

/// {@template emitter}
///
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
