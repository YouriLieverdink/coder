library statement;

import 'package:coder/coder.dart';

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
}
