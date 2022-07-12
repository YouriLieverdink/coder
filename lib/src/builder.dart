library builder;

import 'package:orchestrator/orchestrator.dart';

/// {@template builder}
///
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
