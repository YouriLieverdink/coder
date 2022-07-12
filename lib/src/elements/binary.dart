part of element;

/// {@template binary}
/// Configuration for defining a `binary` element.
/// {@endtemplate}
class Binary extends Element with Builder {
  /// {@macro binary_element}
  const Binary({
    required this.left,
    required this.right,
    required this.operator,
  });

  /// The left side of this statement.
  final Element left;

  /// The right side of this statement.
  final Element right;

  /// The operator between left and right of this statement.
  final String operator;

  @override
  Binary copyWith({
    Element? left,
    Element? right,
    String? operator,
  }) {
    return Binary(
      left: left ?? this.left,
      right: right ?? this.right,
      operator: operator ?? this.operator,
    );
  }
}
