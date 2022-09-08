part of importer;

/// {@template regular_importer}
///
/// {@endtemplate}
class RegularImporter extends Importer {
  /// {@macro regular_importer}
  RegularImporter() : super(imports: {});

  @override
  String? register(
    TypeReference reference,
  ) {
    if (reference.url != null) {
      imports.add(reference.url!);
    }

    return null;
  }
}
