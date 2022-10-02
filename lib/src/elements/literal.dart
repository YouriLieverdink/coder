part of element;

/// {@template literal}
/// Configuration for defining a literal.
/// {@endtemplate}
abstract class Literal<T> extends Element with Builder {
  /// {@macro literal}
  const Literal(
    this.value,
  );

  /// {@macro literal}
  static Literal of<T>(T value) {
    if (value is bool) {
      return LiteralBool(value);
    } //
    else if (value is List) {
      return LiteralList(value);
    } //
    else if (value is Map) {
      return LiteralMap(value);
    } //
    else if (value is num) {
      return LiteralNum(value);
    } //
    else if (value is Set) {
      return LiteralSet(value);
    } //
    else if (value is String) {
      return LiteralString(value);
    } //
    else if (value == null) {
      return const LiteralNull();
    }

    throw UnsupportedError('');
  }

  /// The value of this literal.
  final T value;

  @override
  List<Object?> get props {
    return [value];
  }
}

/// {@template literal_bool}
/// Configuration for defining a literal bool.
/// {@endtemplate}
class LiteralBool extends Literal<bool> {
  /// {@macro literal_bool}
  // ignore: avoid_positional_boolean_parameters
  const LiteralBool(super.value);
}

/// {@template literal_list}
/// Configuration for defining a literal list.
/// {@endtemplate}
class LiteralList extends Literal<List> {
  /// {@macro literal_list}
  const LiteralList(super.value);
}

/// {@template literal_map}
/// Configuration for defining a literal map.
/// {@endtemplate}
class LiteralMap extends Literal<Map> {
  /// {@macro literal_map}
  const LiteralMap(super.value);
}

/// {@template literal_null}
/// Configuration for defining a literal null.
/// {@endtemplate}
class LiteralNull extends Literal<void> {
  /// {@macro literal_null}
  const LiteralNull() : super(null);
}

/// {@template literal_num}
/// Configuration for defining a literal num.
/// {@endtemplate}
class LiteralNum extends Literal<num> {
  /// {@macro literal_num}
  const LiteralNum(super.value);
}

/// {@template literal_set}
/// Configuration for defining a literal set.
/// {@endtemplate}
class LiteralSet extends Literal<Set> {
  /// {@macro literal_set}
  const LiteralSet(super.value);
}

/// {@template literal_string}
/// Configuration for defining a literal string.
/// {@endtemplate}
class LiteralString extends Literal<String> {
  /// {@macro literal_string}
  const LiteralString(super.value);
}
