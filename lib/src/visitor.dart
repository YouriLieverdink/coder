library visitor;

import 'package:coder/src/element.dart';

part './visitors/enum.dart';
part './visitors/reference.dart';

StringSink visit<T extends Element>(
  T element, [
  StringSink? output,
]) {
  output ??= StringBuffer();

  if (element is Enum) {
    visitEnum(element, output);
  } //
  else if (element is Reference) {
    visitReference(element, output);
  }

  return output;
}
