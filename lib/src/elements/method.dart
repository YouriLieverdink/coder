part of element;

/// {@template method_modifier}
enum MethodMofifier { async, asyncStar, syncStar }

/// {@template method_kind}
enum MethodKind { get, set }

/// {@template method}
///
/// {@endtemplate}
class Method extends Element {
  /// {@macro method}
  const Method({
    this.returns = const TypeReference('void'),
    required this.name,
    this.isStatic = false,
    this.modifier,
    this.kind,
    this.parameters = const [],
    this.body = const [],
  });

  final Reference returns;

  final String name;

  final bool isStatic;

  final MethodMofifier? modifier;

  final MethodKind? kind;

  final List<Parameter> parameters;

  final List<Statement> body;

  @override
  Method copyWith({
    Reference? returns,
    String? name,
    bool? isStatic,
    MethodMofifier? modifier,
    MethodKind? kind,
    List<Parameter>? parameters,
    List<Statement>? body,
  }) {
    return Method(
      returns: returns ?? this.returns,
      name: name ?? this.name,
      modifier: modifier ?? this.modifier,
      kind: kind ?? this.kind,
      parameters: parameters ?? this.parameters,
      isStatic: isStatic ?? this.isStatic,
      body: body ?? this.body,
    );
  }
}
