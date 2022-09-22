part of element;

/// {@template for}
/// Configuration for defining a for loop.
/// {@endtemplate}
class For extends Element {
  /// {@macro for}
  const For({
    required this.condition,
    this.body,
  });

  /// The condition of this for.
  final Element condition;

  /// The body of this for.
  final Element? body;

  @override
  List<Object?> get props {
    return [condition, body];
  }
}
