library emitter;

import 'package:coder/src/element.dart';

part './emitters/enum.dart';
part './emitters/reference.dart';

/// {@template emitter}
///
/// {@endtemplate}
abstract class Emitter<T extends Element> {
  /// {@macro emitter}
  const Emitter();

  /// Emits [element] as valid Dart code into [output].
  StringSink emit(
    T element, [
    StringSink? output,
  ]);
}
