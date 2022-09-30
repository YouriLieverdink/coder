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
/// Configuration for defining a method.
/// {@endtemplate}
class Method extends Element with Builder {
  /// {@macro method}
  const Method({
    this.returns,
    this.name,
    this.isStatic = false,
    this.modifier,
    this.kind,
    this.parameters = const [],
    this.body,
    this.docs = const [],
    this.lambda = false,
    this.annotations = const [],
  });

  /// The type this method returns.
  final Reference? returns;

  /// The name of this method.
  final String? name;

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
  final Iterable<Parameter> parameters;

  /// The body of this method.
  final Element? body;

  /// The documentation for this method.
  final Iterable<Docs> docs;

  /// Whether this is a lambda method.
  final bool lambda;

  /// The annotations of this method.
  final Iterable<Annotation> annotations;

  @override
  List<Object?> get props {
    return [
      returns,
      name,
      isStatic,
      modifier,
      kind,
      parameters,
      body,
      docs,
      lambda,
      annotations
    ];
  }
}
