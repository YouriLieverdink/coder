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
    this.constructors = const [],
  });

  final String name;

  final Reference? extends_;

  final List<Field> fields;

  final List<Constructor> constructors;

  @override
  Element copyWith({
    String? name,
    Reference? extends_,
    List<Field>? fields,
    List<Constructor>? constructors,
  }) {
    return Class(
      name: name ?? this.name,
      extends_: extends_ ?? this.extends_,
      fields: fields ?? this.fields,
      constructors: constructors ?? this.constructors,
    );
  }
}
