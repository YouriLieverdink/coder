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
  final Column try_;

  /// The `catch` section of this try-catch block.
  final Column? catch_;

  /// The `finally` section of this try-catch block.
  final Column? finally_;

  @override
  TryCatch copyWith({
    Column? try_,
    Column? catch_,
    Column? finally_,
  }) {
    return TryCatch(
      try_: try_ ?? this.try_,
      catch_: catch_ ?? this.catch_,
      finally_: finally_ ?? this.finally_,
    );
  }
}
