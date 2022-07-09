part of element;

/// {@template class}
///
/// {@endtemplate}
class Class extends Element {
  /// {@macro class}
  const Class({
    required this.name,
    this.extends_,
    this.constructors = const [],
    this.fields = const [],
  });

  final String name;

  final Reference? extends_;

  final List<Constructor> constructors;

  final List<Field> fields;

  @override
  Element copyWith({
    String? name,
    Reference? extends_,
    List<Constructor>? constructors,
    List<Field>? fields,
  }) {
    return Class(
      name: name ?? this.name,
      extends_: extends_ ?? this.extends_,
      constructors: constructors ?? this.constructors,
      fields: fields ?? this.fields,
    );
  }
}
