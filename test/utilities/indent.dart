import 'package:collection/collection.dart';

String indent(
  String data, {
  required String first,
}) {
  //
  final prefix = ' ' * first.length;
  final lines = data.split('\n');

  return lines //
      .mapIndexed((i, v) => i == 0 ? '$first$v' : '$prefix$v')
      .join('\n');
}
