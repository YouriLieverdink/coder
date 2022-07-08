library element;

part './elements/class.dart';
part './elements/enum.dart';
part './elements/field.dart';
part './elements/reference.dart';

/// {@template element}
///
/// {@endtemplate}
abstract class Element {
  /// {@macro element}
  const Element();

  /// Returns an instance of `this` with the provided values.
  Element copyWith();
}
