part of element;

/// {@template if}
/// Configuration for defining an if statement.
/// {@endtemplate}
class If extends Element {
  /// {@macro if}
  const If({
    required this.clauses,
    this.else_,
  });

  /// The clauses of this `if` statement.
  final List<IfClause> clauses;

  /// The else block of this `if` statement.
  final Element? else_;
}

/// {@template if_clause}
/// Configuration for defining an if statement clause.
/// {@endtemplate}
class IfClause extends Element {
  /// {@macro if}
  const IfClause({
    required this.condition,
    this.body,
  });

  /// The condition of this `if` clause.
  final Element condition;

  /// The body of this `if` clause.
  final Element? body;
}
