part of element;

/// {@template reference}
/// Configuration for defining a `reference`.
/// {@endtemplate}
abstract class Reference extends Element {
  /// {@macro reference}
  const Reference({
    this.isNullable = false,
  });

  /// Whether this reference can be null.
  final bool isNullable;
}

/// {@template type_reference}
/// Configuration for defining a `type reference`.
/// {@endtemplate}
class TypeReference extends Reference with Builder {
  /// {@macro type_reference}
  const TypeReference(
    this.symbol, {
    this.url,
    bool isNullable = false,
    this.types = const [],
  }) : super(isNullable: isNullable);

  /// The symbol of this type reference.
  final String symbol;

  /// The url of the package to which this reference belongs.
  final String? url;

  /// The types of this reference.
  final List<Reference> types;

  @override
  TypeReference copyWith({
    String? symbol,
    String? url,
    bool? isNullable,
    List<Reference>? types,
  }) {
    return TypeReference(
      symbol ?? this.symbol,
      url: url ?? this.url,
      isNullable: isNullable ?? this.isNullable,
      types: types ?? this.types,
    );
  }
}

/// {@template function_reference}
/// Configuration for defining a `function reference`.
/// {@endtemplate}
class FunctionReference extends Reference {
  /// {@macro function_reference}
  const FunctionReference({
    this.returns = const TypeReference('void'),
    bool isNullable = false,
    this.parameters = const [],
  }) : super(isNullable: isNullable);

  /// The type this function reference returns.
  final Reference returns;

  /// The parameters of this function reference.
  final List<Parameter> parameters;

  @override
  FunctionReference copyWith({
    Reference? returns,
    bool? isNullable,
    List<Parameter>? parameters,
  }) {
    return FunctionReference(
      returns: returns ?? this.returns,
      isNullable: isNullable ?? this.isNullable,
      parameters: parameters ?? this.parameters,
    );
  }
}
