library context;

import 'package:orchestrator/orchestrator.dart';

/// {@template context}
/// A set of rules which is used to specify certain features throughout all the
/// defined [Emitter]s.
/// {@endtemplate}
class Context {
  /// {@macro context}
  const Context({
    this.useTraillingCommas = false,
    this.importer = const NoImporter(),
  });

  /// An [Importer] can be used to automatically resolve all the dependencies
  /// within the configuration.
  final Importer importer;

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
