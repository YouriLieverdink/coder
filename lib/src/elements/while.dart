part of element;

/// {@template while_kind}
/// Used to indicate whether a while statement is a while or do while.
/// {@endtemplate}
enum WhileKind { while_, doWhile }

/// {@template while}
/// Configuration for defining a while loop.
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
  final Element? body;
}
