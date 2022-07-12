library builder;

import 'package:orchestrator/orchestrator.dart';

/// {@template builder}
/// Used to specify whether an [Element] can be used in other to create complex
/// builder-like statements.
///
/// This mixin is especially useful for the generation of complex Dart code
/// with multiple elements instead of using a single [Static] element with
/// template literals.
///
/// ```dart
/// const element = Static("'cat' == 'dog'");
/// ```
///
/// Can also be written as:
///
/// ```dart
/// const element = Literal('cat').equalTo(Literal('dog'));
/// ```
/// {@endtemplate}
mixin Builder on Element {
  /// Returns the equal to operation of `this` and [other].
  ///
  /// ```dart
  /// this == other
  /// ```
  Builder equalTo(
    Builder other,
  ) {
    return Binary(left: this, right: other, operator: '==');
  }

  /// Returns the not equal to operator of `this` and [other].
  ///
  /// ```dart
  /// this != other
  /// ```
  Builder notEqualTo(
    Builder other,
  ) {
    return Binary(left: this, right: other, operator: '!=');
  }
}
