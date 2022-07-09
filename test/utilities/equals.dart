import 'package:coder/coder.dart';
import 'package:test/test.dart';

import './utilities.dart';

Equals cEquals(
  String expected, {
  required Emitter emitter,
}) {
  return Equals(expected, emitter: emitter);
}

/// {@template equals}
///
/// {@endtemplate}
class Equals extends Matcher {
  /// {@macro equals}
  const Equals(
    this.expected, {
    required this.emitter,
  });

  final String expected;

  final Emitter emitter;

  @override
  Description describe(
    Description description,
  ) {
    return description.add(expected);
  }

  @override
  Description describeMismatch(
    covariant Element item,
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
    covariant Element item,
    Map matchState,
  ) {
    final expected = format(this.expected);
    final actual = format('${emitter.emit(item)}');

    return expected == actual;
  }
}
