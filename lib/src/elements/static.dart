part of element;

/// {@template static}
/// Configuration for defining a static.
/// {@endtemplate}
class Static extends Element with Builder {
  /// {@macro static}
  const Static(
    this.value,
  );

  /// The value of this.
  final String value;
}
