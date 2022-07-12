part of element;

/// {@template while_kind}
/// Used to indicate whether a while statement is a while or do while.
/// {@endtemplate}
enum WhileKind { while_, doWhile }

/// {@template while}
/// Configuration for defining a `while`.
/// {@endtemplate}
class While extends Element {
  /// {@macro while}
  const While({
    required this.condition,
    this.body = const Block(),
    this.kind = WhileKind.while_,
  });

  /// The condition of this while statement.
  final Element condition;

  /// The body of this while statement.
  final Block body;

  /// The kind of while statement this is.
  final WhileKind kind;

  @override
  While copyWith({
    Element? condition,
    Block? body,
    WhileKind? kind,
  }) {
    return While(
      condition: condition ?? this.condition,
      body: body ?? this.body,
      kind: kind ?? this.kind,
    );
  }
}
