part of element;

/// {@template parameter}
/// Configuration for defining a `parameter`.
/// {@endtemplate}
class Parameter extends Element {
  /// {@macro parameter}
  const Parameter({
    this.type = const TypeReference('dynamic'),
    required this.name,
    this.assign,
    this.isRequired = false,
    this.isToThis = false,
    this.isNamed = false,
    this.isOptional = false,
  });

  /// The type of this parameter.
  final Reference type;

  /// The name of this parameter.
  final String name;

  /// The statement used to assign a value to this parameter.
  final Statement? assign;

  /// Whether this parameter is required.
  final bool isRequired;

  /// Whether this field references `this`.
  final bool isToThis;

  /// Whether this field is named.
  final bool isNamed;

  /// Whether this field is optional.
  final bool isOptional;

  @override
  Parameter copyWith({
    Reference? type,
    String? name,
    Statement? assign,
    bool? isRequired,
    bool? isToThis,
    bool? isNamed,
    bool? isOptional,
  }) {
    return Parameter(
      type: type ?? this.type,
      name: name ?? this.name,
      assign: assign ?? this.assign,
      isRequired: isRequired ?? this.isRequired,
      isToThis: isToThis ?? this.isToThis,
      isNamed: isNamed ?? this.isNamed,
      isOptional: isOptional ?? this.isOptional,
    );
  }
}
