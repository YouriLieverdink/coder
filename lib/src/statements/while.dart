part of statement;

/// {@template while_statement}
/// Configuration for defining a `while statement`.
/// {@endtemplate}
class WhileStatement extends Statement {
  /// {@macro while_statement}
  const WhileStatement({
    required this.condition,
    this.body = const [],
  });

  /// The condition of this while statement.
  final Statement condition;

  /// The body of this while statement.
  final List<Statement> body;

  @override
  WhileStatement copyWith({
    Statement? condition,
    List<Statement>? body,
  }) {
    return WhileStatement(
      condition: condition ?? this.condition,
      body: body ?? this.body,
    );
  }
}
