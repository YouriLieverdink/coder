import 'package:coder/coder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:test/test.dart';

final _formatter = DartFormatter();

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

  String format(String value) {
    try {
      return _formatter.format(value);
    } //
    catch (_) {
      // The formatter throws when the provided source is invalid.
      return collapseWhitespace(value).trim();
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
    final actual = format(builder.build(item));

    return expected == actual;
  }
}
