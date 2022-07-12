part of element;

/// {@template method_modifier}
/// Used to indicate whether a method should be `async`, `async*` or `sync*`.
/// {@endtemplate}
enum MethodMofifier { async, asyncStar, syncStar }

/// {@template method_kind}
/// Used to indicate whether a method should be a `getter` or a `setter`.
/// {@endtemplate}
enum MethodKind { get, set }

/// {@template method}
/// Configuration for defining a `method`.
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

  /// The type this method returns.
  final Reference returns;

  /// The name of this method.
  final String name;

  /// Whether this method is static.
  final bool isStatic;

  /// The modifier to apply to this method.
  final MethodMofifier? modifier;

  /// What kind this field is.
  ///
  /// This value can be left unset or set to `null` when the method should be a
  /// 'normal' method.
  final MethodKind? kind;

  /// The parameters of this method.
  final List<Parameter> parameters;

  /// The body of this method.
  final List<Element> body;

  @override
  Method copyWith({
    Reference? returns,
    String? name,
    bool? isStatic,
    MethodMofifier? modifier,
    MethodKind? kind,
    List<Parameter>? parameters,
    List<Element>? body,
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
