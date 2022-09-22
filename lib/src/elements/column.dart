part of element;

/// {@template column}
/// Configuration for defining a column.
/// {@endtemplate}
class Column extends Element {
  /// {@macro column}
  const Column(
    this.elements,
  );

  /// The list of elements this column holds.
  final List<Element> elements;

  @override
  List<Object?> get props {
    return [elements];
  }
}
