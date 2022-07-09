part of element;

/// {@template reference}
///
/// {@endtemplate}
abstract class Reference extends Element {
  /// {@macro reference}
  const Reference({
    this.isNullable = false,
  });

  final bool isNullable;
}

/// {@template type_reference}
///
/// {@endtemplate}
class TypeReference extends Reference {
  /// {@macro type_reference}
  const TypeReference(
    this.symbol, {
    this.url,
    bool isNullable = false,
    this.types = const [],
  }) : super(isNullable: isNullable);

  final String symbol;

  final String? url;

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
///
/// {@endtemplate}
class FunctionReference extends Reference {
  /// {@macro function_reference}
  const FunctionReference({
    this.returns = const TypeReference('void'),
    bool isNullable = false,
    this.parameters = const [],
  }) : super(isNullable: isNullable);

  final Reference returns;

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
