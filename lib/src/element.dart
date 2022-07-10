library element;

import 'package:orchestrator/orchestrator.dart';

part './elements/class.dart';
part './elements/constructor.dart';
part './elements/enum.dart';
part './elements/extension.dart';
part './elements/field.dart';
part './elements/method.dart';
part './elements/parameter.dart';
part './elements/reference.dart';

/// {@template element}
/// Represents an enclosed piece of source code like a class, enum, or field.
///
/// The [Element]s are the building blocks of the source code which needs to
/// be generated. Every [Element] has at least one [Emitter] that transforms
/// its configuration into source code.
/// {@endtemplate}
abstract class Element extends Spec {
  /// {@macro element}
  const Element();
}
