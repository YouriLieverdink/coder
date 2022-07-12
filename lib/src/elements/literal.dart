part of element;

/// {@template literal}
/// Configuration for defining a `literal` element.
/// {@endtemplate}
class Literal<T> extends Element with Builder {
  /// {@macro literal}
  const Literal(
    this.value,
  );

  final T value;

  @override
  Literal copyWith({
    T? value,
  }) {
    return Literal<T>(
      value ?? this.value,
    );
  }
}
