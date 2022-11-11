part of element;

/// {@template enum}
/// Configuration for defining an enum.
/// {@endtemplate}
class Enum extends Element {
  /// {@macro enum}
  const Enum({
    required this.name,
    this.values = const [],
    this.docs = const [],
    this.annotations = const [],
    this.constructors = const [],
    this.fields = const [],
    this.methods = const [],
  });

  /// The name of this enum.
  final String name;

  /// The values of this enum.
  final Iterable<EnumValue> values;

  /// The documentation for this enum.
  final Iterable<Docs> docs;

  /// The annotations of this enum.
  final Iterable<Annotation> annotations;

  /// The constructors of this enum.
  final Iterable<Constructor> constructors;

  /// The fields of this enum.
  final Iterable<Field> fields;

  /// The methods of this enum.
  final Iterable<Method> methods;

  @override
  List<Object?> get props {
    return [name, values, docs, annotations, constructors, fields, methods];
  }
}

/// {@template enum_value}
/// Configuration for defining an enum value.
/// {@endtemplate}
class EnumValue extends Element {
  /// {@macro enum_value}
  const EnumValue(
    this.name, {
    this.docs = const [],
    this.annotations = const [],
    this.arguments = const [],
  });

  /// The name of this enum value.
  final String name;

  /// The documentation for this enum value.
  final Iterable<Docs> docs;

  /// The annotations of this enum.
  final Iterable<Annotation> annotations;

  /// The arguments of this enum value.
  final Iterable<Builder> arguments;

  @override
  List<Object?> get props {
    return [name, docs, annotations, arguments];
  }
}
