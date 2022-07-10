library spec;

/// {@template spec}
/// A specification of Dart source code.
/// {@endtemplate}
abstract class Spec {
  /// {@macro spec}
  const Spec();

  /// Returns an instance of `this` with the provided values.
  Spec copyWith();
}
