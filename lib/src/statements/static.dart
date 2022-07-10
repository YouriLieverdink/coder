part of statement;

/// {@template static_statement}
/// Configuration for defining a `static statement`.
/// {@endtemplate}
class StaticStatement extends Statement {
  /// {@macro static_statement}
  const StaticStatement(
    this.value,
  );

  /// The value of this statement.
  final String value;

  @override
  StaticStatement copyWith({
    String? value,
  }) {
    return StaticStatement(
      value ?? this.value,
    );
  }
}
