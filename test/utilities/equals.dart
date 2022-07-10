import 'package:coder/coder.dart';
import 'package:test/test.dart';

import './utilities.dart';

/// {@template equals}
///
/// {@endtemplate}
class Equals<T> extends Matcher {
  /// {@macro equals}
  const Equals(
    this.expected, {
    required this.emitter,
  });

  final String expected;

  final Emitter<T> emitter;

  @override
  Description describe(
    Description description,
  ) {
    return description.add(expected);
  }

  @override
  Description describeMismatch(
    covariant T item,
    Description mismatchDescription,
    Map matchState,
    bool verbose,
  ) {
    final expected = format(this.expected);
    final actual = format('${emitter.emit(item)}');

    return equals(expected).describeMismatch(
      actual,
      mismatchDescription,
      matchState,
      verbose,
    );
  }

  @override
  bool matches(
    covariant T item,
    Map matchState,
  ) {
    final expected = format(this.expected);
    final actual = format('${emitter.emit(item)}');

    return expected == actual;
  }
}
