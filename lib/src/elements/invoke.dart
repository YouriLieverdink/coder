part of element;

/// {@template invoke}
/// Configuration for defining a invocation.
/// {@endtemplate}
class Invoke extends Element with Builder {
  /// {@macro invoke}
  const Invoke(
    this.elements,
  );

  /// The elements within this invocation.
  final Iterable<Element> elements;

  @override
  List<Object?> get props {
    return [elements];
  }
}
