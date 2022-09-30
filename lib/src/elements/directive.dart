part of element;

/// {@template directive_kind}
/// Used to indicate whether it should be an `import`, `export`, `part`, or
/// `part of` directive.
/// {@endtemplate}
enum DirectiveKind { import, part, partOf, export }

/// {@template directive}
/// Configuration for defining a directive.
/// {@endtemplate}
class Directive extends Element implements Comparable<Directive> {
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
  ///
  /// ```dart
  /// export './utilities.dart';
  ///               ^
  /// ```
  final String url;

  /// What kind of directive this is.
  ///
  /// ```dart
  /// part 'dart:core';
  ///   ^
  /// ```
  final DirectiveKind kind;

  /// The name to use for the import
  ///
  /// ```dart
  /// import 'dart:core' as core;
  ///                         ^
  /// ```
  final String? as;

  /// The index within a list of sorted directives.
  ///
  /// ```dart
  /// import 'dart:core';              // 0
  /// import 'package:test/test.dart'; // 1
  /// ```
  int get index {
    if (kind == DirectiveKind.import) {
      // There are three different types of imports.
      if (RegExp(r'^dart:.*$').hasMatch(url)) {
        return -3;
      }

      if (RegExp(r'^package:.*\.dart$').hasMatch(url)) {
        return -2;
      }

      if (RegExp(r'^\.+\/.*\.dart$').hasMatch(url)) {
        return -1;
      }
    }

    return kind.index;
  }

  @override
  int compareTo(
    Directive other,
  ) {
    final difference = index - other.index;

    if (difference == 0) {
      // When the directives are the same, sort alpabetically.
      return url.compareTo(other.url);
    }

    return difference;
  }

  @override
  List<Object?> get props {
    return [url, kind, as];
  }
}
