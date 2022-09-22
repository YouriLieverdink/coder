part of element;

/// {@template annotation}
/// Configuration for defining an annotation.
/// {@endtemplate}
class Annotation extends Element {
  /// {@macro annotation}
  const Annotation({
    required this.type,
    this.arguments = const [],
  });

  /// The value of this.
  final TypeReference type;

  /// The arguments of this.
  final List<Builder> arguments;

  @override
  List<Object?> get props {
    return [type, arguments];
  }
}
