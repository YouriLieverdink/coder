import 'package:coder/coder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:test/test.dart';

final _formatter = DartFormatter();

Matcher equalsCode(String expected) => EqualsCode(expected);

/// {@template equals_code}
///
/// {@endtemplate}
class EqualsCode extends Matcher {
  /// {@macro equals_code}
  const EqualsCode(
    this.expected, {
    this.builder = const Builder(),
  });

  final String expected;

  final Builder builder;

  /// Forms the provided [value] using the [DartFormatter].
  ///
  /// When the [DartFormatter] fails for some reason, most often due to
  /// incorrect source code, the [value] will simply be returned.
  String format(
    String value,
  ) {
    final _value = collapseWhitespace(value);

    try {
      return _formatter.format(_value);
    } //
    catch (_) {
      return _value;
    }
  }

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
    final actual = format(builder.build(item));

    return equals(expected)
        .describeMismatch(actual, mismatchDescription, matchState, verbose);
  }

  @override
  bool matches(
    covariant Element item,
    Map matchState,
  ) {
    final expected = format(this.expected);
    final actual = format(builder.build(item));

    return expected == actual;
  }
}
