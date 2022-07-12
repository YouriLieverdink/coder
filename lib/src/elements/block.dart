part of element;

/// {@template block}
/// Configuration for defining a `block` of elements.
/// {@endtemplate}
class Block extends Element {
  /// {@macro block}
  const Block({
    this.elements = const [],
  });

  final List<Element> elements;

  @override
  Block copyWith({
    List<Element>? elements,
  }) {
    return Block(
      elements: elements ?? this.elements,
    );
  }
}
