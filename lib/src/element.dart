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

  /// Visit `this` element and emit Dart code to [output].
  StringSink visit([StringSink? output]);
}
