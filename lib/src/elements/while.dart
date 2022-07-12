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
    this.kind = WhileKind.while_,
    this.body,
  });

  /// The condition of this while statement.
  final Element condition;

  /// The kind of while statement this is.
  final WhileKind kind;

  /// The body of this while statement.
  final Column? body;

  @override
  While copyWith({
    Element? condition,
    WhileKind? kind,
    Column? body,
  }) {
    return While(
      condition: condition ?? this.condition,
      kind: kind ?? this.kind,
      body: body ?? this.body,
    );
  }
}
