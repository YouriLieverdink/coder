part of element;

/// {@template directive_kind}
/// Used to indicate whether it should be an `import`, `export`, `part`, or
/// `part of` directive.
/// {@endtemplate}
enum DirectiveKind { import, export, part, partOf }

/// {@template directive}
/// Configuration for defining a directive.
/// {@endtemplate}
class Directive extends Element {
  /// {@macro directive}
  const Directive({
    required this.url,
    required this.kind,
    this.as,
  });

  /// {@macro directive}
  factory Directive.import(
    String url, {
    String? as,
  }) {
    return Directive(url: url, kind: DirectiveKind.import, as: as);
  }

  /// {@macro directive}
  factory Directive.export(
    String url, {
    String? as,
  }) {
    return Directive(url: url, kind: DirectiveKind.export, as: as);
  }

  /// {@macro directive}
  factory Directive.part(
    String url, {
    String? as,
  }) {
    return Directive(url: url, kind: DirectiveKind.part, as: as);
  }

  /// {@macro directive}
  factory Directive.partOf(
    String url, {
    String? as,
  }) {
    return Directive(url: url, kind: DirectiveKind.partOf, as: as);
  }

  /// The url this directive references.
  final String url;

  /// What kind of directive this is.
  final DirectiveKind kind;

  /// The name to use for the import
  ///
  /// ```dart
  /// import 'dart:core' as core;
  /// ```
  final String? as;

  @override
  List<Object?> get props {
    return [url, kind, as];
  }
}
