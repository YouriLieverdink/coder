part './elements/enum.dart';

/// {@template element}
///
/// {@endtemplate}
abstract class Element {
  /// {@macro element}
  const Element();

  /// Returns an instance of `this` with the provided values.
  Element copyWith();
}
