part of element;

/// {@template constructor}
///
/// {@endtemplate}
class Constructor extends Element {
  /// {@macro constructor}
  const Constructor({
    this.isConst = false,
    this.isFactory = false,
    this.name,
  });

  final bool isConst;

  final bool isFactory;

  final String? name;

  @override
  Constructor copyWith({
    bool? isConst,
    bool? isFactory,
  }) {
    return Constructor(
      isConst: isConst ?? this.isConst,
      isFactory: isFactory ?? this.isFactory,
    );
  }
}
