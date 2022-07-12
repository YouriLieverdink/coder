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
  final List<Element>? default_;

  @override
  Switch copyWith({
    Element? condition,
    List<SwitchCase>? cases,
    List<Element>? default_,
  }) {
    return Switch(
      condition: condition ?? this.condition,
      cases: cases ?? this.cases,
      default_: default_ ?? this.default_,
    );
  }
}

/// {@template switch_case}
/// Configuration for defining a `switch case`.
/// {@endtemplate}
class SwitchCase extends Element {
  /// {@macro switch_case}
  const SwitchCase({
    required this.condition,
    this.body = const [],
  });

  /// The condition of this switch case.
  final Element condition;

  /// The body of this switch case.
  final List<Element> body;

  @override
  SwitchCase copyWith({
    Element? condition,
    List<Element>? body,
  }) {
    return SwitchCase(
      condition: condition ?? this.condition,
      body: body ?? this.body,
    );
  }
}
