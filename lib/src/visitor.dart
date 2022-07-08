import 'package:coder/src/element.dart';

part './visitors/enum.dart';

StringSink visit<T extends Element>(
  T element, [
  StringSink? output,
]) {
  output ??= StringBuffer();

  switch (element.runtimeType) {
    case Enum:
      visitEnum(element as Enum, output);
      break;
  }

  return output;
}
