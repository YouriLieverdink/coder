part of element;

/// {@template constructor}
/// Configuration for defining a constructor.
/// {@endtemplate}
class Constructor extends Element {
  /// {@macro constructor}
  const Constructor({
    this.isConst = false,
    this.isFactory = false,
    this.name,
    this.parameters = const [],
    this.body,
    this.docs = const [],
    this.initializers = const [],
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

  /// The documentation for this constructor.
  final List<Docs> docs;

  /// The initialisers of this constructor.
  final List<Element> initializers;

  @override
  List<Object?> get props {
    return [isConst, isFactory, name, parameters, body, docs, initializers];
  }
}
