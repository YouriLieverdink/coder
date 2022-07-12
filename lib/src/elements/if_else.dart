part of element;

/// {@template if_else}
/// Configuration for defining an `if-else statement`.
/// {@endtemplate}
class IfElse extends Element {
  /// {@macro if_else}
  const IfElse({
    required this.condition,
    required this.then,
    this.else_ = const Block(),
  });

  /// The condition of this if-else statement.
  final Element condition;

  /// The then block of this if-else statement.
  final Block then;

  /// The else block of this if-else statement.
  final Block else_;

  @override
  IfElse copyWith({
    Element? condition,
    Block? then,
    Block? else_,
  }) {
    return IfElse(
      condition: condition ?? this.condition,
      then: then ?? this.then,
      else_: else_ ?? this.else_,
    );
  }
}
