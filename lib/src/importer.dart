library importer;

import 'package:orchestrator/orchestrator.dart';

part './importers/no.dart';
part './importers/regular.dart';

/// {@template importer}
///
/// {@endtemplate}
abstract class Importer {
  /// {@macro importer}
  const Importer({
    this.imports = const {},
  });

  ///
  final Set<String> imports;

  ///
  String? register(
    TypeReference reference,
  );
}
