part of element;

/// {@template constructor}
/// Configuration for defining a class `constructor`.
/// {@endtemplate}
class Constructor extends Element {
  /// {@macro constructor}
  const Constructor({
    this.isConst = false,
    this.isFactory = false,
    this.name,
    this.parameters = const [],
    this.body,
  });

  /// Whether this constructor is a constant constructor.
  final bool isConst;

  /// Whether this constructor is a factory constructor.
  final bool isFactory;

  /// The name of the constructor.
  final String? name;

  /// The parameters of this constructor.
  final List<Parameter> parameters;

  /// The body of this constructor.
  final Element? body;
}
