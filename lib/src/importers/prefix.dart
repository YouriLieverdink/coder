part of importer;

/// {@template prefix_importer}
/// Registers all the imports just like the [RegularImporter] but also prefixed
/// every dependency to ensure type collisions do not happen.
/// {@endtemplate}
class PrefixImporter extends Importer {
  /// {@macro prefix_importer}
  PrefixImporter({
    super.exclude,
  }) : super(imports: {});

  @override
  String? register(
    TypeReference reference,
  ) {
    if (reference.url == null || exclude.contains(reference.url)) {
      return null;
    }

    try {
      final import = imports //
          .where((v) => v.url == reference.url)
          .first;

      return import.as;
    } //
    catch (_) {
      // This is the first registration of this dependency.
      final prefix = '_i${imports.length + 1}';

      final directive = Directive.import(
        reference.url!,
        as: prefix,
      );

      imports.add(directive);

      return prefix;
    }
  }
}
