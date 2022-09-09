part of importer;

/// {@template no_importer}
/// The [NoImporter] is a constant placeholder for the [Context] class so we
/// don't have to work with `null` values.
///
/// This importer does not actually register any dependencies to be imported.
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
