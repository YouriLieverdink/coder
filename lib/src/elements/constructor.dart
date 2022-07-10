part of element;

/// {@template constructor}
///
/// {@endtemplate}
class Constructor extends Element {
  /// {@macro constructor}
  const Constructor({
    this.isConst = false,
    this.isFactory = false,
    this.name,
    this.parameters = const [],
    this.body = const [],
  });

  final bool isConst;

  final bool isFactory;

  final String? name;

  final List<Parameter> parameters;

  final List<Statement> body;

  @override
  Constructor copyWith({
    bool? isConst,
    bool? isFactory,
    String? name,
    List<Parameter>? parameters,
    List<Statement>? body,
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
