part of element;

/// {@template field_modifier}
/// Used to indicate whether an instance field should be `constant` or a `final`
/// field.
/// {@endtemplate}
enum FieldModifier { const_, final_ }

/// {@template field}
/// Configuration for defining a field.
/// {@endtemplate}
class Field extends Element {
  /// {@macro field}
  const Field({
    this.type = const TypeReference('dynamic'),
    required this.name,
    this.assign,
    this.modifier,
    this.isStatic = false,
    this.isLate = false,
    this.docs = const [],
  });

  /// The type of this field.
  final Reference type;

  /// The name of this field.
  final String name;

  /// The statement used to assign a value to this field.
  final Element? assign;

  /// The modifier to apply to this field.
  final FieldModifier? modifier;

  /// Whether this field is static.
  final bool isStatic;

  /// Whether this field is late.
  final bool isLate;

  /// The documentation for this field.
  final List<Docs> docs;
}
