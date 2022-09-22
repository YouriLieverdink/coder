part of element;

/// {@template annotation}
/// Configuration for defining an annotation.
/// {@endtemplate}
class Annotation extends Element {
  /// {@macro annotation}
  const Annotation(
    this.value, {
    this.arguments = const [],
  });

  /// The value of this.
  final String value;

  /// The arguments of this.
  final List<Builder> arguments;

  @override
  List<Object?> get props {
    return [value, arguments];
  }
}
