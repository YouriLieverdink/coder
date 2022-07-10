import 'package:test/test.dart';

import './utilities.dart';

/// {@template expect}
/// Used to match the provided [item] with the result of the [matcher].
/// {@endtemplate}
class Expect<T> {
  /// {@macro expect}
  Expect(
    T item,
    Equals<T> matcher,
  ) {
    if (matcher.matches(item, {})) return;

    // Prepare a Buffer which holds the error description.
    final output = StringBuffer();

    final expected = format(matcher.expected);
    final actual = format('${matcher.emitter.emit(item)}');

    // We use the matchers mismatch description to describe the exact location.
    final description = StringDescription();
    matcher.describeMismatch(item, description, {}, false);

    output
      ..writeln(indent(expected, first: 'Expected: '))
      ..writeln(indent(actual, first: '  Actual: '))
      ..writeln(indent('$description', first: '   Which: '));

    throw TestFailure('$output');
  }
}
