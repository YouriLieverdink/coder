part of element;

/// {@template statement}
/// Configuration for defining a `statement`.
/// {@endtemplate}
class Statement extends Element {
  /// {@macro statement}
  const Statement(
    this.value,
  );

  /// The value of this statement.
  final String value;

  @override
  Statement copyWith({
    String? value,
  }) {
    return Statement(
      value ?? this.value,
    );
  }
}
