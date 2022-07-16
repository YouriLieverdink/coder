part of element;

/// {@template try_catch}
/// Configuration for defining a try-catch block.
/// {@endtemplate}
class TryCatch extends Element {
  /// {@macro try_catch}
  const TryCatch({
    required this.try_,
    this.catch_,
    this.finally_,
  });

  /// The `try` section of this try-catch block.
  final Element try_;

  /// The `catch` section of this try-catch block.
  final Element? catch_;

  /// The `finally` section of this try-catch block.
  final Element? finally_;
}
