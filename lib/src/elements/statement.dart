part of element;

/// {@template statement}
///
/// {@endtemplate}
class Statement extends Element {
  /// {@macro statement}
  const Statement(
    this.value,
  );

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
