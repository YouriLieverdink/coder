part of element;

/// {@template class}
///
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

  final String name;

  final Reference? extends_;

  final List<Reference> implements;

  final List<Reference> with_;

  final bool isAbstract;

  final List<Constructor> constructors;

  final List<Field> fields;

  @override
  Element copyWith({
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
