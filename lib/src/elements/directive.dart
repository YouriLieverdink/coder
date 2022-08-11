part of element;

/// {@template directive_kind}
/// Used to indicate whether it should be an `import`, `export`, `part`, or
/// `part of` directive.
/// {@endtemplate}
enum DirectiveKind { import, export, part, partOf }

/// {@template directive}
/// Configuration for defining a `directive`.
/// {@endtemplate}
class Directive extends Element {
  /// {@macro directive}
  const Directive({
    required this.url,
    required this.kind,
  });

  /// {@macro directive}
  factory Directive.import(
    String url,
  ) {
    return Directive(url: url, kind: DirectiveKind.import);
  }

  /// {@macro directive}
  factory Directive.export(
    String url,
  ) {
    return Directive(url: url, kind: DirectiveKind.export);
  }

  /// {@macro directive}
  factory Directive.part(
    String url,
  ) {
    return Directive(url: url, kind: DirectiveKind.part);
  }

  /// {@macro directive}
  factory Directive.partOf(
    String url,
  ) {
    return Directive(url: url, kind: DirectiveKind.partOf);
  }

  /// The url this directive references.
  final String url;

  /// What kind of directive this is.
  final DirectiveKind kind;
}
