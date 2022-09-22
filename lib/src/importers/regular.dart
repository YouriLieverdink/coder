part of importer;

/// {@template regular_importer}
/// Used to register all dependencies of the [TypeReference]s used within the
/// configuration.
/// {@endtemplate}
class RegularImporter extends Importer {
  /// {@macro regular_importer}
  RegularImporter() : super(imports: {});

  @override
  String? register(
    TypeReference reference,
  ) {
    if (reference.url != null) {
      final directive = Directive.import(reference.url!);

      imports.add(directive);
    }

    return null;
  }
}
