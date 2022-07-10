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
    this.body = const [],
  });

  /// Whether this constructor is a constant constructor.
  ///
  /// ```dart
  /// class Cat {
  ///   const Cat();
  /// }
  /// ```
  final bool isConst;

  /// Whether this constructor is a factory constructor.
  ///
  /// ```dart
  /// class Cat {
  ///   factory Cat() {}
  /// }
  /// ```
  final bool isFactory;

  /// The name of the constructor.
  ///
  /// ```dart
  /// class Cat {
  ///   Cat.fromJson() {}
  /// }
  /// ```
  final String? name;

  /// The parameters of this constructor.
  ///
  /// ```dart
  /// class Cat {
  ///   Cat(String name) {}
  /// }
  /// ```
  ///
  /// * See [Parameter] for more information.
  final List<Parameter> parameters;

  /// The body of this constructor.
  ///
  /// ```dart
  /// class Cat {
  ///   Cat() {
  ///     print('meow!');
  ///   }
  /// }
  /// ```
  ///
  /// * See [Statement] for more information.
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
