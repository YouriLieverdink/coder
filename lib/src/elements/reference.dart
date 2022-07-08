part of element;

/// {@template reference}
///
/// {@endtemplate}
abstract class Reference extends Element {
  /// {@macro reference}
  const Reference();
}

/// {@template type_reference}
///
/// {@endtemplate}
class TypeReference extends Reference {
  /// {@macro type_reference}
  const TypeReference(
    this.symbol, {
    this.url,
    this.isNullable = false,
    this.types = const [],
  });

  final String symbol;

  final String? url;

  final bool isNullable;

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
  });

  final Reference returns;

  @override
  FunctionReference copyWith({
    Reference? returns,
  }) {
    return FunctionReference(
      returns: returns ?? this.returns,
    );
  }
}
