library element;

import 'package:orchestrator/orchestrator.dart';

part './elements/binary.dart';
part './elements/class.dart';
part './elements/constructor.dart';
part './elements/enum.dart';
part './elements/extension.dart';
part './elements/field.dart';
part './elements/for.dart';
part './elements/if.dart';
part './elements/literal.dart';
part './elements/method.dart';
part './elements/parameter.dart';
part './elements/reference.dart';
part './elements/static.dart';
part './elements/while.dart';

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
