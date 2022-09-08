part of importer;

/// {@template no_importer}
///
/// {@endtemplate}
class NoImporter extends Importer {
  /// {@macro no_importer}
  const NoImporter();

  @override
  String? register(
    TypeReference reference,
  ) {
    return null;
  }
}
