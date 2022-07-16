part of element;

/// {@template switch}
/// Configuration for defining a `switch`.
/// {@endtemplate}
class Switch extends Element {
  /// {@macro switch}
  const Switch({
    required this.condition,
    this.cases = const [],
    this.default_,
  });

  /// The condition of this switch.
  final Element condition;

  /// The cases of this switch.
  final List<SwitchCase> cases;

  /// The default case of this switch.
  final Element? default_;
}

/// {@template switch_case}
/// Configuration for defining a `switch case`.
/// {@endtemplate}
class SwitchCase extends Element {
  /// {@macro switch_case}
  const SwitchCase({
    required this.condition,
    this.body,
  });

  /// The condition of this switch case.
  final Element condition;

  /// The body of this switch case.
  final Element? body;
}
