part of element;

/// {@template library}
/// Configuration for defining a library.
/// {@endtemplate}
class Library extends Element {
  /// {@macro library}
  const Library({
    this.name,
    this.directives = const [],
    this.elements = const [],
    this.docs = const [],
  });

  /// The name of this library.
  final String? name;

  /// The directives which this library should use.
  final List<Directive> directives;

  /// The elements contained within this library.
  final List<Element> elements;

  /// The documentation for this library.
  final List<Docs> docs;
}
