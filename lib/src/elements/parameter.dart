part of element;

/// {@template parameter}
///
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

  final Reference type;

  final String name;

  final Statement? assign;

  final bool isRequired;

  final bool isToThis;

  final bool isNamed;

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
