part of statement;

/// {@template literal_statement}
/// Configuration for defining a `literal statement`.
/// {@endtemplate}
class LiteralStatement<T> extends Statement {
  /// {@macro literal_statement}
  const LiteralStatement(
    this.value,
  );

  final T value;

  @override
  Statement copyWith({
    T? value,
  }) {
    return LiteralStatement<T>(
      value ?? this.value,
    );
  }
}
