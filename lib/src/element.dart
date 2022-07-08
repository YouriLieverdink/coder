library element;

import 'package:coder/coder.dart';

part './elements/enum.dart';
part './elements/reference.dart';

/// {@template element}
///
/// {@endtemplate}
abstract class Element {
  /// {@macro element}
  const Element();

  /// Returns an instance of `this` with the provided values.
  Element copyWith();

  /// Emits `this` element as valid Dart code into [output].
  StringSink emit([StringSink? output]);
}
