part of statement;

/// {@template binary_statement}
/// Configuration for defining a `binary statement`.
/// {@endtemplate}
class Binary extends Statement {
  /// {@macro binary_statement}
  const Binary({
    required this.left,
    required this.right,
    required this.operator,
  });

  /// The left side of this statement.
  final Statement left;

  /// The right side of this statement.
  final Statement right;

  /// The operator between left and right of this statement.
  final String operator;

  @override
  Binary copyWith({
    Statement? left,
    Statement? right,
    String? operator,
  }) {
    return Binary(
      left: left ?? this.left,
      right: right ?? this.right,
      operator: operator ?? this.operator,
    );
  }
}
