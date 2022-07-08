library visitor;

import 'package:coder/src/element.dart';

part './visitors/enum.dart';
part './visitors/reference.dart';

StringSink visit<T extends Element>(
  T element, [
  StringSink? output,
]) {
  output ??= StringBuffer();

  element.visit(output);

  return output;
}
