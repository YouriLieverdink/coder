part of statement;

/// {@template static_statement}
/// Configuration for defining a `static statement`.
/// {@endtemplate}
class Static extends Statement {
  /// {@macro static_statement}
  const Static(
    this.value,
  );

  /// The value of this statement.
  final String value;

  @override
  Static copyWith({
    String? value,
  }) {
    return Static(
      value ?? this.value,
    );
  }
}
