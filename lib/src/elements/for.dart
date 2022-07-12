part of element;

/// {@template for}
/// Configuration for defining a `for`.
/// {@endtemplate}
class For extends Element {
  /// {@macro for}
  const For({
    required this.condition,
    this.body = const [],
  });

  /// The condition of this for.
  final Element condition;

  /// The body of this for.
  final List<Element> body;

  @override
  For copyWith({
    Element? condition,
    List<Element>? body,
  }) {
    return For(
      condition: condition ?? this.condition,
      body: body ?? this.body,
    );
  }
}
