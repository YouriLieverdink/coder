part of statement;

/// {@template for_statement}
/// Configuration for defining a `for statement`.
/// {@endtemplate}
class ForStatement extends Statement {
  /// {@macro for_statement}
  const ForStatement({
    required this.condition,
    this.body = const [],
  });

  /// The condition of this for statement.
  final Statement condition;

  /// The body of this for statement.
  final List<Statement> body;

  @override
  ForStatement copyWith({
    Statement? condition,
    List<Statement>? body,
  }) {
    return ForStatement(
      condition: condition ?? this.condition,
      body: body ?? this.body,
    );
  }
}
