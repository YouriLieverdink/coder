part of element;

/// {@template if_else}
/// Configuration for defining an `if-else statement`.
/// {@endtemplate}
class IfElse extends Element {
  /// {@macro if_else}
  const IfElse({
    required this.condition,
    required this.then,
    this.else_,
  });

  /// The condition of this if-else statement.
  final Element condition;

  /// The then block of this if-else statement.
  final Element then;

  /// The else block of this if-else statement.
  final Element? else_;
}
