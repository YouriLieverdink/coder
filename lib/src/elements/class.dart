part of element;

/// {@template class}
///
/// {@endtemplate}
class Class extends Element {
  /// {@macro class}
  const Class({
    required this.name,
    this.extends_,
    this.fields = const [],
  });

  final String name;

  final Reference? extends_;

  final List<Field> fields;

  @override
  Element copyWith({
    String? name,
    Reference? extends_,
    List<Field>? fields,
  }) {
    return Class(
      name: name ?? this.name,
      extends_: extends_ ?? this.extends_,
      fields: fields ?? this.fields,
    );
  }
}
