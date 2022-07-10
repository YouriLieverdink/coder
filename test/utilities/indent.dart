import 'package:collection/collection.dart';

/// Indents the [data] by the length of [first] for every line.
///
/// ```dart
/// void main() {
///   const data = '''
///     class Cat {
///       String name;
///     }
///   ''';
///
///   final value = indent(data, 'Class: ');
///
///   assert(value == '''
///     Class: class Cat {
///              String name;
///            }
///   ''');
/// }
/// ```
String indent(
  String data, {
  required String first,
}) {
  final prefix = ' ' * first.length;

  return data
      .split('\n')
      .mapIndexed((i, v) => i == 0 ? '$first$v' : '$prefix$v')
      .join('\n');
}
