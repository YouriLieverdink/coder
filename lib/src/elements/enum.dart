part of element;

/// {@template enum}
///
/// {@endtemplate}
class Enum extends Element {
  /// {@macro enum}
  const Enum({
    required this.name,
    this.values = const [],
  });

  final String name;

  final List<EnumValue> values;

  @override
  Enum copyWith({
    String? name,
    List<EnumValue>? values,
  }) {
    return Enum(
      name: name ?? this.name,
      values: values ?? this.values,
    );
  }

  @override
  StringSink visit([StringSink? output]) {
    return visitEnum(this, output);
  }
}

/// {@template enum_value}
///
/// {@endtemplate}
class EnumValue extends Element {
  /// {@macro enum_value}
  const EnumValue({
    required this.name,
  });

  final String name;

  @override
  EnumValue copyWith({
    String? name,
  }) {
    return EnumValue(
      name: name ?? this.name,
    );
  }

  @override
  StringSink visit([StringSink? output]) {
    return visitEnumValue(this, output);
  }
}
