part of element;

/// {@template field_modifier}
///
/// {@endtemplate}
enum FieldModifier { const_, final_ }

/// {@template field}
///
/// {@endtemplate}
class Field extends Element {
  /// {@macro field}
  const Field({
    this.type = const TypeReference('dynamic'),
    required this.name,
    this.modifier,
    this.isStatic = false,
    this.isLate = false,
  });

  final Reference type;

  final String name;

  final FieldModifier? modifier;

  final bool isStatic;

  final bool isLate;

  @override
  Field copyWith({
    Reference? type,
    String? name,
    FieldModifier? kind,
    bool? isStatic,
    bool? isLate,
  }) {
    return Field(
      type: type ?? this.type,
      name: name ?? this.name,
      modifier: kind ?? this.modifier,
      isStatic: isStatic ?? this.isStatic,
      isLate: isLate ?? this.isLate,
    );
  }
}
