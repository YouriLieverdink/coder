part of element;

/// {@template try_catch}
/// Configuration for defining a try-catch block.
/// {@endtemplate}
class TryCatch extends Element {
  /// {@macro try_catch}
  const TryCatch({
    required this.try_,
    this.catch_ = const Block(),
    this.finally_ = const Block(),
  });

  /// The `try` section of this try-catch block.
  final Block try_;

  /// The `catch` section of this try-catch block.
  final Block catch_;

  /// The `finally` section of this try-catch block.
  final Block finally_;

  @override
  TryCatch copyWith({
    Block? try_,
    Block? catch_,
    Block? finally_,
  }) {
    return TryCatch(
      try_: try_ ?? this.try_,
      catch_: catch_ ?? this.catch_,
      finally_: finally_ ?? this.finally_,
    );
  }
}
