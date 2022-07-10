library context;

import 'package:coder/coder.dart';

/// {@template context}
/// A set of rules which is used to specify certain features throughout all the
/// defined [Emitter]s.
/// {@endtemplate}
class Context {
  /// {@macro context}
  const Context({
    this.useTraillingCommas = false,
  });

  /// Whether the emitters should use trailling commas.
  ///
  /// Currently, trailling commas are appended to parameter lists and to values
  /// within enums.
  ///
  /// ```dart
  /// enum CatState {
  ///   sleeping,
  ///   purring,
  ///   eating, <- extra comma is placed here.
  /// }
  /// ```
  final bool useTraillingCommas;
}
