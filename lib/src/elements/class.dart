part of element;

/// {@template class}
/// Configuration for defining a `class`.
/// {@endtemplate}
class Class extends Element {
  /// {@macro class}
  const Class({
    required this.name,
    this.extends_,
    this.implements = const [],
    this.with_ = const [],
    this.isAbstract = false,
    this.constructors = const [],
    this.fields = const [],
  });

  /// The name of the class.
  final String name;

  /// The class this class should extend.
  final Reference? extends_;

  /// The classes this class should implement.
  final List<Reference> implements;

  /// The mixins this class should use.
  final List<Reference> with_;

  /// Whether this is class is abstract.
  final bool isAbstract;

  /// The constructors of this class.
  final List<Constructor> constructors;

  /// The fields of this class.
  final List<Field> fields;

  @override
  Class copyWith({
    String? name,
    Reference? extends_,
    List<Reference>? implements,
    List<Reference>? with_,
    bool? isAbstract,
    List<Constructor>? constructors,
    List<Field>? fields,
  }) {
    return Class(
      name: name ?? this.name,
      extends_: extends_ ?? this.extends_,
      implements: implements ?? this.implements,
      with_: with_ ?? this.with_,
      isAbstract: isAbstract ?? this.isAbstract,
      constructors: constructors ?? this.constructors,
      fields: fields ?? this.fields,
    );
  }
}
