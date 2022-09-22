part of element;

/// {@template loop_kind}
/// Used to indicate whether to use `for`, `while`, or `doWhile`.
/// {@endtemplate}
enum LoopKind { for_, while_, doWhile }

/// {@template loop}
/// Configuration for defining a for, while, or do-while loop.
/// {@endtemplate}
class Loop extends Element {
  /// {@macro loop}
  const Loop({
    required this.clause,
    required this.kind,
    this.body,
  });

  /// The configuration of this loop.
  final Element clause;

  /// What kind of loop this is.
  final LoopKind kind;

  /// The body of this loop.
  final Element? body;

  @override
  List<Object?> get props {
    return [clause, kind, body];
  }
}
