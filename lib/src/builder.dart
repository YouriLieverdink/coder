library builder;

import 'package:coder/coder.dart';

/// {@template builder}
///
/// {@endtemplate}
class Builder {
  /// {@macro builder}
  const Builder({
    this.context = const Context(),
  });

  final Context context;

  String build<T extends Element>(
    T element,
  ) {
    final output = StringBuffer();

    if (element is Class) {
      ClassEmitter(context).emit(element, output);
    } //
    else if (element is Enum) {
      EnumEmitter(context).emit(element, output);
    } //
    else if (element is Field) {
      FieldEmitter(context).emit(element, output);
    } //
    else if (element is Reference) {
      ReferenceEmitter(context).emit(element, output);
    }

    return output.toString();
  }
}
