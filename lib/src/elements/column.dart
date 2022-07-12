part of element;

/// {@template column}
/// Configuration for defining a `column` of elements.
/// {@endtemplate}
class Column extends Element {
  /// {@macro column}
  const Column(
    this.elements,
  );

  final List<Element> elements;

  @override
  Column copyWith({
    List<Element>? elements,
  }) {
    return Column(
      elements ?? this.elements,
    );
  }
}
