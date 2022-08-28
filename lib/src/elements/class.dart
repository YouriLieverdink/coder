part of element;

/// {@template class}
/// Configuration for defining a class.
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
    this.methods = const [],
    this.docs = const [],
    this.annotations = const [],
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

  /// The methods of this class.
  final List<Method> methods;

  /// The documentation for this class.
  final List<Docs> docs;

  /// The annotations of this class.
  final List<Annotation> annotations;
}
