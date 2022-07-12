part of statement;

/// {@template literal_statement}
/// Configuration for defining a `literal statement`.
/// {@endtemplate}
class Literal<T> extends Statement {
  /// {@macro literal_statement}
  const Literal(
    this.value,
  );

  final T value;

  @override
  Literal copyWith({
    T? value,
  }) {
    return Literal<T>(
      value ?? this.value,
    );
  }
}
