library importer;

import 'package:orchestrator/orchestrator.dart';

part './importers/no.dart';
part './importers/regular.dart';

/// {@template importer}
/// An [Importer] can be used to automatically resolve dependencies. This class
/// can be extended for multiple implementations.
/// {@endtemplate}
abstract class Importer {
  /// {@macro importer}
  const Importer({
    this.imports = const {},
  });

  /// The imports registered by this importer.
  final Set<Directive> imports;

  /// Registers the provided [reference] to be imported.
  String? register(
    TypeReference reference,
  );
}
