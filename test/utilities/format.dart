import 'package:dart_style/dart_style.dart';
import 'package:test/test.dart';

String format(
  String value,
) {
  try {
    return DartFormatter() //
        .format(value)
        .trim();
  } //
  catch (_) {
    return collapseWhitespace(value);
  }
}
