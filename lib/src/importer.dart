library importer;

import 'package:orchestrator/orchestrator.dart';

part './importers/no.dart';
part './importers/prefix.dart';
part './importers/regular.dart';

/// {@template importer}
/// An [Importer] can be used to automatically resolve dependencies. This class
/// can be extended for multiple implementations.
/// {@endtemplate}
abstract class Importer {
  /// {@macro importer}
  const Importer({
    this.imports = const {},
    this.exclude = const ['dart:core'],
  });

  /// The imports registered by this importer.
  final Set<Directive> imports;

  /// The imports to ignore whilst registering references.
  final List<String> exclude;

  /// Registers the provided [reference] to be imported.
  String? register(
    TypeReference reference,
  );
}
