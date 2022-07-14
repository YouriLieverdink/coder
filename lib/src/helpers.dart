library helpers;

import 'package:orchestrator/orchestrator.dart';

StringSink emit<T extends Element>(
  T element, [
  Context context = const Context(),
]) {
  final emitter = ElementEmitter(context);

  return emitter.emit(element);
}

Literal literal(
  dynamic value,
) {
  if (value is bool) {
    return LiteralBool(value);
  } //
  else if (value is List) {
    return LiteralList(value);
  } //
  else if (value is num) {
    return LiteralNum(value);
  } //
  else if (value is String) {
    return LiteralString(value);
  } //
  else if (value == null) {
    return const LiteralNull();
  }

  throw UnsupportedError('');
}

Static static(
  String value,
) {
  return Static(value);
}

TypeReference type(
  String symbol, [
  String? url,
]) {
  return TypeReference(symbol, url: url);
}
