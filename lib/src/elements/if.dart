part of element;

/// {@template if}
/// Configuration for defining an `if statement`.
/// {@endtemplate}
class If extends Element {
  /// {@macro if}
  const If({
    required this.condition,
    required this.then,
    this.else_ = const [],
  });

  /// The condition of this if statement.
  final Element condition;

  /// The then block of this if statement.
  final List<Element> then;

  /// The else block of this if statement.
  final List<Element> else_;

  @override
  If copyWith({
    Element? condition,
    List<Element>? then,
    List<Element>? else_,
  }) {
    return If(
      condition: condition ?? this.condition,
      then: then ?? this.then,
      else_: else_ ?? this.else_,
    );
  }
}
