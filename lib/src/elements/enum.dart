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
  });

  /// The name of this enum.
  final String name;

  /// The values of this enum.
  final List<EnumValue> values;

  /// The documentation for this enum.
  final List<Docs> docs;

  /// The annotations of this enum.
  final List<Annotation> annotations;

  @override
  List<Object?> get props {
    return [name, values, docs, annotations];
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
  });

  /// The name of this enum value.
  final String name;

  /// The documentation for this enum value.
  final List<Docs> docs;

  /// The annotations of this enum.
  final List<Annotation> annotations;

  @override
  List<Object?> get props {
    return [name, docs, annotations];
  }
}
