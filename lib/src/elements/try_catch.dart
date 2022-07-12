part of element;

/// {@template try_catch}
/// Configuration for defining a try-catch block.
/// {@endtemplate}
class TryCatch extends Element {
  /// {@macro try_catch}
  const TryCatch({
    required this.try_,
    this.catch_ = const [],
    this.finally_ = const [],
  });

  /// The `try` section of this try-catch block.
  final List<Element> try_;

  /// The `catch` section of this try-catch block.
  final List<Element> catch_;

  /// The `finally` section of this try-catch block.
  final List<Element> finally_;

  @override
  TryCatch copyWith({
    List<Element>? try_,
    List<Element>? catch_,
    List<Element>? finally_,
  }) {
    return TryCatch(
      try_: try_ ?? this.try_,
      catch_: catch_ ?? this.catch_,
      finally_: finally_ ?? this.finally_,
    );
  }
}
