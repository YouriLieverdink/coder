library builder;

import 'package:orchestrator/orchestrator.dart';
import 'package:orchestrator/src/builder.dart' as builder;

/// {@template builder_add}
/// Returns the + operator of `this` and [other].
///
/// ```dart
/// this + other
/// ```
/// {@endtemplate}
Builder add(Builder value, Builder other) {
  return Row.binary(left: value, right: other, operator: '+');
}

/// {@template builder_and}
/// Returns the and operation of `this` and [other].
///
/// ```dart
/// this && other
/// ```
/// {@endtemplate}
Builder and(
  Builder value,
  Builder other,
) {
  return Row.binary(left: value, right: other, operator: '&&');
}

/// {@template builder_as}
/// Returns the as operation of `this` and [other].
///
/// ```dart
/// this as other
/// ```
/// {@endtemplate}
Builder as(
  Builder value,
  Builder other,
) {
  return Row.binary(left: value, right: other, operator: 'as');
}

/// {@template builder_assign}
/// Returns the assign operation of `this` and [other].
///
/// ```dart
/// this = other
/// ```
/// {@endtemplate}
Builder assign(
  Builder value,
  Builder other,
) {
  return Row.binary(left: value, right: other, operator: '=');
}

/// {@template builder_assign_coalescing}
/// Returns the assign coalescing of `this` and [other].
///
/// ```dart
/// this ??= other
/// ```
/// {@endtemplate}
Builder assignCoalescing(
  Builder value,
  Builder other,
) {
  return Row.binary(left: value, right: other, operator: '??=');
}

/// {@template builder_awaited}
/// Returns `this` prefixed with await.
///
/// ```dart
/// await this
/// ```
/// {@endtemplate}
Builder awaited(
  Builder value,
) {
  return Row([
    const Static('await '),
    value,
  ]);
}

/// {@template declare_const}
/// Returns `this` prefixed with const.
///
/// ```dart
/// const this
/// ```
/// {@endtemplate}
Builder declareConst(
  Builder value,
) {
  return Row([
    const Static('const '),
    value,
  ]);
}

/// {@template declare_final}
/// Returns `this` prefixed with final.
///
/// ```dart
/// final this
/// ```
/// {@endtemplate}
Builder declareFinal(
  Builder value,
) {
  return Row([
    const Static('final '),
    value,
  ]);
}

/// {@template declare_type}
/// Returns `this` prefixed with the provided type.
///
/// ```dart
/// type this
/// ```
/// {@endtemplate}
Builder declareType(
  Builder value,
  Reference type,
) {
  return Row([
    type,
    const Static(' '),
    value,
  ]);
}

/// {@template declare_var}
/// Returns `this` prefixed with var.
///
/// ```dart
/// var this
/// ```
/// {@endtemplate}
Builder declareVar(
  Builder value,
) {
  return Row([
    const Static('var '),
    value,
  ]);
}

/// {@template builder_divide}
/// Returns the / operator of `this` and [other].
///
/// ```dart
/// this / other
/// ```
/// {@endtemplate}
Builder divide(
  Builder value,
  Builder other,
) {
  return Row.binary(left: value, right: other, operator: '/');
}

/// {@template builder_equal_to}
/// Returns the equal to operation of `this` and [other].
///
/// ```dart
/// this == other
/// ```
/// {@endtemplate}
Builder equalTo(
  Builder value,
  Builder other,
) {
  return Row.binary(left: value, right: other, operator: '==');
}

/// {@template builder_greater_than}
/// Returns the greater than operation of `this` and [other].
///
/// ```dart
/// this > other
/// ```
///
/// When [reverse] is `true`, the result will be:
///
/// ```dart
/// this < other
/// ```
/// {@endtemplate}
Builder greaterThan(
  Builder value,
  Builder other, {
  bool reverse = false,
}) {
  final operator = reverse ? '<' : '>';

  return Row.binary(left: value, right: other, operator: operator);
}

/// {@template builder_greater_than_or_equal_to}
/// Returns the greater than or equal to of `this` and [other].
///
/// ```dart
/// this >= other
/// ```
///
/// When [reverse] is `true`, the result will be:
///
/// ```dart
/// this <= other
/// ```
/// {@endtemplate}
Builder greaterThanOrEqualTo(
  Builder value,
  Builder other, {
  bool reverse = false,
}) {
  final operator = reverse ? '<=' : '>=';

  return Row.binary(left: value, right: other, operator: operator);
}

/// {@template builder_in}
/// Returns the in operation of `this` and [other].
///
/// ```dart
/// this in other
/// ```
/// {@endtemplate}
Builder in_(
  Builder value,
  Builder other,
) {
  return Row.binary(left: value, right: other, operator: 'in');
}

/// {@template builder_index}
/// Returns the index operation on `this` with [other].
///
/// ```dart
/// this[other]
/// ```
/// {@endtemplate}
Builder index(
  Builder value,
  Builder other,
) {
  return Row([
    value,
    const Static('['),
    other,
    const Static(']'),
  ]);
}

/// {@template builder_invoke}
/// Returns the invocation of `this`.
///
/// ```dart
/// this()
/// ```
/// {@endtemplate}
Builder invoke(
  Builder value, [
  List<Element>? elements,
]) {
  elements ??= const [];

  return Row([
    value,
    Invoke(elements),
  ]);
}

/// {@template builder_is_a}
/// Returns the is operation of `this` and [other].
///
/// ```dart
/// this is other
/// ```
/// {@endtemplate}
Builder isA(
  Builder value,
  Builder other,
) {
  return Row.binary(left: value, right: other, operator: 'is');
}

/// {@template builder_is_not_a}
/// Returns the is not operator of `this` and [other].
///
/// ```dart
/// this is! other
/// ```
/// {@endtemplate}
Builder isNotA(
  Builder value,
  Builder other,
) {
  return Row.binary(left: value, right: other, operator: 'is!');
}

/// {@template builder_modulo}
/// Returns the % operator of `this` and [other].
///
/// ```dart
/// this % other
/// ```
/// {@endtemplate}
Builder modulo(
  Builder value,
  Builder other,
) {
  return Row.binary(left: value, right: other, operator: '%');
}

/// {@template builder_multiply}
/// Returns the * operator of `this` and [other].
///
/// ```dart
/// this * other
/// ```
/// {@endtemplate}
Builder multiply(
  Builder value,
  Builder other,
) {
  return Row.binary(left: value, right: other, operator: '*');
}

/// {@template builder_named}
/// Returns `this` as a named parameter with [name].
///
/// ```dart
/// name: this
/// ```
/// {@endtemplate}
Builder named(
  Builder value,
  String name,
) {
  return Row([
    Static('$name: '),
    value,
  ]);
}

/// {@template builder_negated}
/// Returns the negated version of `this`.
///
/// ```dart
/// !this
/// ```
/// {@endtemplate}
Builder negated(
  Builder value,
) {
  return Row([
    const Static('!'),
    value,
  ]);
}

/// {@template builder_not_equal_to}
/// Returns the not equal to operator of `this` and [other].
///
/// ```dart
/// this != other
/// ```
/// {@endtemplate}
Builder notEqualTo(
  Builder value,
  Builder other,
) {
  return Row.binary(left: value, right: other, operator: '!=');
}

/// {@template builder_or}
/// Returns the or operator of `this` and [other].
///
/// ```dart
/// this || other
/// ```
/// {@endtemplate}
Builder or(
  Builder value,
  Builder other,
) {
  return Row.binary(left: value, right: other, operator: '||');
}

/// {@template builder_property}
/// Returns the name property of `this`.
///
/// ```dart
/// this.name
/// ```
/// {@endtemplate}
Builder property(
  Builder value,
  String name,
) {
  return Row([
    value,
    Static('.$name'),
  ]);
}

/// {@template builder_property_asserted}
/// Returns the name property of `this` asserted.
///
/// ```dart
/// this!.name
/// ```
/// {@endtemplate}
Builder propertyAssert(
  Builder value,
  String name,
) {
  return Row([
    value,
    Static('!.$name'),
  ]);
}

/// {@template builder_property_cascade}
/// Returns the name property of `this` as cascade.
///
/// ```dart
/// this..name
/// ```
/// {@endtemplate}
Builder propertyCascade(
  Builder value,
  String name,
) {
  return Row([
    value,
    Static('..$name'),
  ]);
}

/// {@template builder_property_conditional}
/// Returns the name property of `this` conditionally.
///
/// ```dart
/// this?.name
/// ```
/// {@endtemplate}
Builder propetyConditional(
  Builder value,
  String name,
) {
  return Row([
    value,
    Static('?.$name'),
  ]);
}

/// {@template builder_returned}
/// Returns `this` prefixed with return.
///
/// ```dart
/// return this
/// ```
/// {@endtemplate}
Builder returned(
  Builder value,
) {
  return Row([
    const Static('return '),
    value,
  ]);
}

/// {@template builder_spread}
/// Returns `this` prefixed with the spread operator.
///
/// ```dart
/// ...this
/// ```
/// {@endtemplate}
Builder spread(
  Builder value,
) {
  return Row([
    const Static('...'),
    value,
  ]);
}

/// {@template builder_statement}
/// Returns `this` as a statement with a suffixed ;.
///
/// ```dart
/// this;
/// ```
/// {@endtemplate}
Builder statement(
  Builder value,
) {
  return Row([
    value,
    const Static(';'),
  ]);
}

/// {@template builder_subtract}
/// Returns the - operator of `this` and [other].
///
/// ```dart
/// this - other
/// ```
/// {@endtemplate}
Builder subtract(
  Builder value,
  Builder other,
) {
  return Row.binary(left: value, right: other, operator: '-');
}

/// {@template builder_thrown}
/// Returns `this` prefixed with throw.
///
/// ```dart
/// throw this
/// ```
/// {@endtemplate}
Builder thrown(
  Builder value,
) {
  return Row([
    const Static('throw '),
    value,
  ]);
}

/// {@template builder_yielded}
/// Returns `this` prefixed with yield.
///
/// ```dart
/// yield this
/// ```
/// {@endtemplate}
Builder yielded(
  Builder value,
) {
  return Row([
    const Static('yield '),
    value,
  ]);
}

/// {@template builder}
/// Used to specify whether an [Element] can be used in other to create complex
/// builder-like statements.
///
/// This mixin is especially useful for the generation of complex Dart code
/// with multiple elements instead of using a single [Static] element with
/// template literals.
///
/// ```dart
/// const element = Static("'cat' == 'dog'");
/// ```
///
/// Can also be written as:
///
/// ```dart
/// const element = Literal('cat').equalTo(Literal('dog'));
/// ```
/// {@endtemplate}
mixin Builder on Element {
  /// {@macro builder_add}
  Builder add(
    Builder other,
  ) {
    return builder.add(this, other);
  }

  /// {@macro builder_and}
  Builder and(
    Builder other,
  ) {
    return builder.and(this, other);
  }

  /// {@macro builder_as}
  Builder as(
    Builder other,
  ) {
    return builder.as(this, other);
  }

  /// {@macro builder_assign}
  Builder assign(
    Builder other,
  ) {
    return builder.assign(this, other);
  }

  /// {@macro builder_assign_coalescing}
  Builder assignCoalescing(
    Builder other,
  ) {
    return builder.assignCoalescing(this, other);
  }

  // /// {@macro builder_assign_const}
  // Builder assignConst(
  //   String name,
  // ) {
  //   return builder.assignConst(this, name);
  // }

  // /// {@macro builder_assign_final}
  // Builder assignFinal(
  //   String name,
  // ) {
  //   return builder.assignFinal(this, name);
  // }

  // /// {@macro builder_assign_var}
  // Builder assignVar(
  //   String name,
  // ) {
  //   return builder.assignVar(this, name);
  // }

  /// {@macro declare_const}
  Builder get declareConst {
    return builder.declareConst(this);
  }

  /// {@macro declare_final}
  Builder get declareFinal {
    return builder.declareFinal(this);
  }

  /// {@macro declare_type}
  Builder declareType(
    Reference type,
  ) {
    return builder.declareType(this, type);
  }

  /// {@macro declare_var}
  Builder get declareVar {
    return builder.declareVar(this);
  }

  /// {@macro builder_awaited}
  Builder get awaited {
    return builder.awaited(this);
  }

  /// {@macro builder_divide}
  Builder divide(
    Builder other,
  ) {
    return builder.divide(this, other);
  }

  /// {@macro builder_equal_to}
  Builder equalTo(
    Builder other,
  ) {
    return builder.equalTo(this, other);
  }

  /// {@macro builder_greater_than}
  Builder greaterThan(
    Builder other, {
    bool reverse = false,
  }) {
    return builder.greaterThan(this, other, reverse: reverse);
  }

  /// {@macro builder_greater_than_or_equal_to}
  Builder greaterThanOrEqualTo(
    Builder other, {
    bool reverse = false,
  }) {
    return builder.greaterThanOrEqualTo(this, other, reverse: reverse);
  }

  /// {@macro builder_in}
  Builder in_(
    Builder other,
  ) {
    return builder.in_(this, other);
  }

  /// {@macro builder_index}
  Builder index(
    Builder other,
  ) {
    return builder.index(this, other);
  }

  /// {@macro builder_invoke}
  Builder invoke([
    List<Element>? elements,
  ]) {
    return builder.invoke(this, elements);
  }

  /// {@macro builder_is_a}
  Builder isA(
    Builder other,
  ) {
    return builder.isA(this, other);
  }

  /// {@macro builder_is_not_a}
  Builder isNotA(
    Builder other,
  ) {
    return builder.isNotA(this, other);
  }

  /// {@macro builder_modulo}
  Builder modulo(
    Builder other,
  ) {
    return builder.modulo(this, other);
  }

  /// {@macro builder_multiply}
  Builder multiply(
    Builder other,
  ) {
    return builder.multiply(this, other);
  }

  /// {@macro builder_named}
  Builder named(
    String name,
  ) {
    return builder.named(this, name);
  }

  /// {@macro builder_negated}
  Builder get negated {
    return builder.negated(this);
  }

  /// {@macro builder_not_equal_to}
  Builder notEqualTo(
    Builder other,
  ) {
    return builder.notEqualTo(this, other);
  }

  /// {@macro builder_or}
  Builder or(
    Builder other,
  ) {
    return builder.or(this, other);
  }

  /// {@macro builder_property}
  Builder property(
    String name,
  ) {
    return builder.property(this, name);
  }

  /// {@macro builder_property_asserted}
  Builder propertyAssert(
    String name,
  ) {
    return builder.propertyAssert(this, name);
  }

  /// {@macro builder_property_cascade}
  Builder propertyCascade(
    String name,
  ) {
    return builder.propertyCascade(this, name);
  }

  /// {@macro builder_property_conditional}
  Builder propetyConditional(
    String name,
  ) {
    return builder.propetyConditional(this, name);
  }

  /// {@macro builder_returned}
  Builder get returned {
    return builder.returned(this);
  }

  /// {@macro builder_spread}
  Builder get spread {
    return builder.spread(this);
  }

  /// {@macro builder_statement}
  Builder get statement {
    return builder.statement(this);
  }

  /// {@macro builder_subtract}
  Builder subtract(
    Builder other,
  ) {
    return builder.subtract(this, other);
  }

  /// {@macro builder_thrown}
  Builder get thrown {
    return builder.thrown(this);
  }

  /// {@macro builder_yielded}
  Builder get yielded {
    return builder.yielded(this);
  }
}
