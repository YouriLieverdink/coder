part of element;

/// {@template mixin}
/// Configuration for defining a mixin.
/// {@endtemplate}
class Mixin extends Element {
  /// {@macro mixin}
  const Mixin({
    required this.name,
    this.on,
    this.fields = const [],
    this.methods = const [],
    this.docs = const [],
    this.annotations = const [],
  });

  /// The name of the mixin.
  ///
  /// ```dart
  /// mixin Walkable {
  /// }
  /// ```
  final String name;

  /// The class this mixin should be limited to.
  ///
  /// ```dart
  /// mixin Walkable on Cat {
  /// }
  /// ```
  final Reference? on;

  /// The fields of this mixin.
  ///
  /// ```dart
  /// mixin Walkable {
  ///   int legs = 4;
  /// }
  /// ```
  final List<Field> fields;

  /// The methods of this mixin.
  ///
  /// ```dart
  /// mixin Walkable {
  ///   void jump() {
  ///   }
  /// }
  /// ```
  final List<Method> methods;

  /// The documentation for this mixin.
  ///
  /// ```dart
  /// /// Hello, this is a mixin!
  /// mixin Walkable {
  /// }
  /// ```
  final List<Docs> docs;

  /// The annotations of this mixin.
  ///
  /// ```dart
  /// @Superb
  /// mixin Walkable {
  /// }
  /// ```
  final List<Annotation> annotations;
}
