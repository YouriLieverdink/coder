part of statement;

/// {@template while_statement_kind}
/// Used to indicate whether a while statement is a while or do while.
/// {@endtemplate}
enum WhileStatementKind { while_, doWhile }

/// {@template while_statement}
/// Configuration for defining a `while statement`.
/// {@endtemplate}
class WhileStatement extends Statement {
  /// {@macro while_statement}
  const WhileStatement({
    required this.condition,
    this.body = const [],
    this.kind = WhileStatementKind.while_,
  });

  /// The condition of this while statement.
  final Statement condition;

  /// The body of this while statement.
  final List<Statement> body;

  /// The kind of while statement this is.
  final WhileStatementKind kind;

  @override
  WhileStatement copyWith({
    Statement? condition,
    List<Statement>? body,
    WhileStatementKind? kind,
  }) {
    return WhileStatement(
      condition: condition ?? this.condition,
      body: body ?? this.body,
      kind: kind ?? this.kind,
    );
  }
}
