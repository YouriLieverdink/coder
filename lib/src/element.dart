library element;

import 'package:coder/coder.dart';

part './elements/class.dart';
part './elements/constructor.dart';
part './elements/enum.dart';
part './elements/field.dart';
part './elements/method.dart';
part './elements/parameter.dart';
part './elements/reference.dart';
part './elements/statement.dart';

/// {@template element}
/// Represents an enclosed piece of source code like a class, enum, or field.
///
/// The [Element]s are the building blocks of the source code which needs to
/// be generated. Every [Element] has at least one [Emitter] that transforms
/// its configuration into source code.
/// {@endtemplate}
abstract class Element {
  /// {@macro element}
  const Element();

  /// Returns an instance of `this` with the provided values.
  Element copyWith();
}
