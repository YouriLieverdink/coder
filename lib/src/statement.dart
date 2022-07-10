library statement;

import 'package:coder/coder.dart';

part './statements/binary.dart';
part './statements/literal.dart';
part './statements/static.dart';

/// {@template statement}
/// Represents a couple lines source code like an if-else clause, switch, or a
/// the assignment of a variable.
///
/// A [Statement] can be used to generate complex lines of Dart code within the
/// bodies of constructors and methods. Every [Statement] has at least one
/// [Emitter] that transforms its configuration into source code.
/// {@endtemplate}
abstract class Statement {
  /// {@macro statement}
  const Statement();

  /// Returns an instance of `this` with the provided values.
  Statement copyWith();

  /// Returns the equal to operation of `this` and [other].
  ///
  /// ```dart
  /// this == other
  /// ```
  Statement equalTo(
    Statement other,
  ) {
    return BinaryStatement(left: this, right: other, operator: '==');
  }

  /// Returns the not equal to operator of `this` and [other].
  ///
  /// ```dart
  /// this != other
  /// ```
  Statement notEqualTo(
    Statement other,
  ) {
    return BinaryStatement(left: this, right: other, operator: '!=');
  }
}
