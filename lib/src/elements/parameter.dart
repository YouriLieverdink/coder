part of element;

/// {@template parameter_kind}
/// Used to indicate whether a parameter is named or optional.
/// {@endtemplate}
enum ParameterKind { named, optional }

/// {@template parameter}
/// Configuration for defining a parameter.
/// {@endtemplate}
class Parameter extends Element {
  /// {@macro parameter}
  const Parameter({
    this.type = const TypeReference('dynamic'),
    required this.name,
    this.assign,
    this.isRequired = false,
    this.isToThis = false,
    this.kind,
  });

  /// The type of this parameter.
  final Reference type;

  /// The name of this parameter.
  final String name;

  /// The statement used to assign a value to this parameter.
  final Element? assign;

  /// Whether this parameter is required.
  final bool isRequired;

  /// Whether this field references `this`.
  final bool isToThis;

  /// What kind of parameter this is.
  ///
  /// This value can be left unset or set to `null` when the parameter should be
  /// a 'normal' parameter.
  final ParameterKind? kind;
}
