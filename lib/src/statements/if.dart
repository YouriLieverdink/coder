part of statement;

/// {@template if_statement}
/// Configuration for defining an `if statement`.
/// {@endtemplate}
class IfStatement extends Statement {
  /// {@macro if_statement}
  const IfStatement({
    required this.condition,
    required this.then,
    this.else_ = const [],
  });

  /// The condition of this if statement.
  final Statement condition;

  /// The then block of this if statement.
  final List<Statement> then;

  /// The else block of this if statement.
  final List<Statement> else_;

  @override
  IfStatement copyWith({
    Statement? condition,
    List<Statement>? then,
    List<Statement>? else_,
  }) {
    return IfStatement(
      condition: condition ?? this.condition,
      then: then ?? this.then,
      else_: else_ ?? this.else_,
    );
  }
}
