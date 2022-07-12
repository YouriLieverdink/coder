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
  final Column? body;

  @override
  Constructor copyWith({
    bool? isConst,
    bool? isFactory,
    String? name,
    List<Parameter>? parameters,
    Column? body,
  }) {
    return Constructor(
      isConst: isConst ?? this.isConst,
      isFactory: isFactory ?? this.isFactory,
      name: name ?? this.name,
      parameters: parameters ?? this.parameters,
      body: body ?? this.body,
    );
  }
}
