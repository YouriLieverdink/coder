part of element;

/// {@template if_else}
/// Configuration for defining an `if-else statement`.
/// {@endtemplate}
class IfElse extends Element {
  /// {@macro if_else}
  const IfElse({
    required this.condition,
    required this.then,
    this.else_ = const [],
  });

  /// The condition of this if-else statement.
  final Element condition;

  /// The then block of this if-else statement.
  final List<Element> then;

  /// The else block of this if-else statement.
  final List<Element> else_;

  @override
  IfElse copyWith({
    Element? condition,
    List<Element>? then,
    List<Element>? else_,
  }) {
    return IfElse(
      condition: condition ?? this.condition,
      then: then ?? this.then,
      else_: else_ ?? this.else_,
    );
  }
}
