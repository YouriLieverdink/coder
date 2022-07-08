part of element;

/// {@template reference}
///
/// {@endtemplate}
class Reference extends Element {
  /// {@macro reference}
  const Reference({
    required this.symbol,
    this.url,
    this.isNullable = false,
    this.types = const [],
  });

  final String symbol;

  final String? url;

  final bool isNullable;

  final List<Reference> types;

  @override
  Reference copyWith({
    String? symbol,
    String? url,
    bool? isNullable,
    List<Reference>? types,
  }) {
    return Reference(
      symbol: symbol ?? this.symbol,
      url: url ?? this.url,
      isNullable: isNullable ?? this.isNullable,
      types: types ?? this.types,
    );
  }

  @override
  StringSink visit([StringSink? output]) => visitReference(this, output);
}
