import 'package:dart_style/dart_style.dart';
import 'package:test/test.dart';

/// Formats the provided [value] using the the [DartFormatter] from dart_style.
///
/// The [DartFormatter] throws when the provided [value] does not contain valid
/// Dart source code. When this happens, the simple `collapseWhitespace`
/// function is used to format the [value].
String format(
  String value,
) {
  try {
    return DartFormatter() //
        .format(value)
        .trim();
  } catch (_) {
    return collapseWhitespace(value);
  }
}
