library element;

part './elements/class.dart';
part './elements/constructor.dart';
part './elements/enum.dart';
part './elements/field.dart';
part './elements/method.dart';
part './elements/parameter.dart';
part './elements/reference.dart';
part './elements/statement.dart';

/// {@template element}
///
/// {@endtemplate}
abstract class Element {
  /// {@macro element}
  const Element();

  /// Returns an instance of `this` with the provided values.
  Element copyWith();
}
