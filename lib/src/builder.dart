library builder;

import 'package:orchestrator/orchestrator.dart';

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
  /// Returns the + operator of `this` and [other].
  ///
  /// ```dart
  /// this + other
  /// ```
  Builder add(
    Builder other,
  ) {
    return Row.binary(left: this, right: other, operator: '+');
  }

  /// Returns the and operation of `this` and [other].
  ///
  /// ```dart
  /// this && other
  /// ```
  Builder and(
    Builder other,
  ) {
    return Row.binary(left: this, right: other, operator: '&&');
  }

  /// Returns the as operation of `this` and [other].
  ///
  /// ```dart
  /// this as other
  /// ```
  Builder as(
    Builder other,
  ) {
    return Row.binary(left: this, right: other, operator: 'as');
  }

  /// Returns the assign operation of `this` and [other].
  ///
  /// ```dart
  /// this = other
  /// ```
  Builder assign(
    Builder other,
  ) {
    return Row.binary(left: this, right: other, operator: '=');
  }

  /// Returns the assign coalescing of `this` and [other].
  ///
  /// ```dart
  /// this ??= other
  /// ```
  Builder assignCoalescing(
    Builder other,
  ) {
    return Row.binary(left: this, right: other, operator: '??=');
  }

  /// Returns `this` assigned to [name] as const.
  ///
  /// ```dart
  /// const name = this
  /// ```
  Builder assignConst(
    String name,
  ) {
    return Row([
      const Static('const '),
      Static(name).assign(this),
    ]);
  }

  /// Returns `this` assigned to [name] as final.
  ///
  /// ```dart
  /// final name = this
  /// ```
  Builder assignFinal(
    String name,
  ) {
    return Row([
      const Static('final '),
      Static(name).assign(this),
    ]);
  }

  /// Returns `this` assigned to [name] as var.
  ///
  /// ```dart
  /// var name = this
  /// ```
  Builder assignVar(
    String name,
  ) {
    return Row([
      const Static('var '),
      Static(name).assign(this),
    ]);
  }

  /// Returns `this` prefixed with await.
  ///
  /// ```dart
  /// await this
  /// ```
  Builder await_() {
    return Row([
      const Static('await '),
      this,
    ]);
  }

  /// Returns the invocation of `this`.
  ///
  /// ```dart
  /// this()
  /// ```
  Builder invoke([
    List<Element>? elements,
  ]) {
    elements ??= const [];

    return Row([
      this,
      Invoke(elements),
    ]);
  }

  /// Returns the / operator of `this` and [other].
  ///
  /// ```dart
  /// this / other
  /// ```
  Builder divide(
    Builder other,
  ) {
    return Row.binary(left: this, right: other, operator: '/');
  }

  /// Returns the equal to operation of `this` and [other].
  ///
  /// ```dart
  /// this == other
  /// ```
  Builder equalTo(
    Builder other,
  ) {
    return Row.binary(left: this, right: other, operator: '==');
  }

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
  Builder greaterThan(
    Builder other, {
    bool reverse = false,
  }) {
    final operator = reverse ? '<' : '>';

    return Row.binary(left: this, right: other, operator: operator);
  }

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
  Builder greaterThanOrEqualTo(
    Builder other, {
    bool reverse = false,
  }) {
    final operator = reverse ? '<=' : '>=';

    return Row.binary(left: this, right: other, operator: operator);
  }

  /// Returns the index operation on `this` with [other].
  ///
  /// ```dart
  /// this[other]
  /// ```
  Builder index(
    Builder other,
  ) {
    return Row([
      this,
      const Static('['),
      other,
      const Static(']'),
    ]);
  }

  /// Returns the is operation of `this` and [other].
  ///
  /// ```dart
  /// this is other
  /// ```
  Builder is_(
    Builder other,
  ) {
    return Row.binary(left: this, right: other, operator: 'is');
  }

  /// Returns the is not operator of `this` and [other].
  ///
  /// ```dart
  /// this is! other
  /// ```
  Builder isNot(
    Builder other,
  ) {
    return Row.binary(left: this, right: other, operator: 'is!');
  }

  /// Returns the % operator of `this` and [other].
  ///
  /// ```dart
  /// this % other
  /// ```
  Builder modulo(
    Builder other,
  ) {
    return Row.binary(left: this, right: other, operator: '%');
  }

  /// Returns the * operator of `this` and [other].
  ///
  /// ```dart
  /// this * other
  /// ```
  Builder multiply(
    Builder other,
  ) {
    return Row.binary(left: this, right: other, operator: '*');
  }

  /// Returns `this` as a named parameter with [name].
  ///
  /// ```dart
  /// name: this
  /// ```
  Builder named(
    String name,
  ) {
    return Row([
      Static('$name: '),
      this,
    ]);
  }

  /// Returns the negated version of `this`.
  ///
  /// ```dart
  /// !this
  /// ```
  Builder negate() {
    return Row([
      const Static('!'),
      this,
    ]);
  }

  /// Returns the not equal to operator of `this` and [other].
  ///
  /// ```dart
  /// this != other
  /// ```
  Builder notEqualTo(
    Builder other,
  ) {
    return Row.binary(left: this, right: other, operator: '!=');
  }

  /// Returns the or operator of `this` and [other].
  ///
  /// ```dart
  /// this || other
  /// ```
  Builder or(
    Builder other,
  ) {
    return Row.binary(left: this, right: other, operator: '||');
  }

  /// Returns the name property of `this`.
  ///
  /// ```dart
  /// this.name
  /// ```
  Builder property(
    String name,
  ) {
    return Row([
      this,
      Static('.$name'),
    ]);
  }

  /// Returns the name property of `this` asserted.
  ///
  /// ```dart
  /// this!.name
  /// ```
  Builder propertyAssert(
    String name,
  ) {
    return Row([
      this,
      Static('!.$name'),
    ]);
  }

  /// Returns the name property of `this` as cascade.
  ///
  /// ```dart
  /// this..name
  /// ```
  Builder propertyCascade(
    String name,
  ) {
    return Row([
      this,
      Static('..$name'),
    ]);
  }

  /// Returns the name property of `this` conditionally.
  ///
  /// ```dart
  /// this?.name
  /// ```
  Builder propetyConditional(
    String name,
  ) {
    return Row([
      this,
      Static('?.$name'),
    ]);
  }

  /// Returns `this` prefixed with return.
  ///
  /// ```dart
  /// return this
  /// ```
  Builder return_() {
    return Row([
      const Static('return '),
      this,
    ]);
  }

  /// Returns `this` prefixed with the spread operator.
  ///
  /// ```dart
  /// ...this
  /// ```
  Builder spread() {
    return Row([
      const Static('...'),
      this,
    ]);
  }

  /// Returns the - operator of `this` and [other].
  ///
  /// ```dart
  /// this - other
  /// ```
  Builder subtract(
    Builder other,
  ) {
    return Row.binary(left: this, right: other, operator: '-');
  }

  /// Returns `this` prefixed with throw.
  ///
  /// ```dart
  /// throw this
  /// ```
  Builder throw_() {
    return Row([
      const Static('throw '),
      this,
    ]);
  }

  /// Returns `this` prefixed with yield.
  ///
  /// ```dart
  /// yield this
  /// ```
  Builder yield_() {
    return Row([
      const Static('yield '),
      this,
    ]);
  }
}
