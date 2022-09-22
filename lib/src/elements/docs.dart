part of element;

/// {@template docs}
/// Configuration for defining Dart documentation.
/// {@endtemplate}
class Docs extends Element {
  /// {@macro docs}
  const Docs(
    this.value,
  );

  /// The value of this.
  final String value;

  @override
  List<Object?> get props {
    return [value];
  }
}
