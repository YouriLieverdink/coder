part of emitter;

/// {@template if_emitter}
/// Emits the [If] configuration into Dart source code.
/// {@endtemplate}
class IfEmitter extends Emitter<If> {
  /// {@macro if_emitter}
  const IfEmitter(super.context);

  @override
  StringSink emit(
    If element, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    for (final v in element.clauses) {
      IfClauseEmitter(context, element).emit(v, output);
    }

    if (element.else_ != null) {
      output.write(' else { ');

      ElementEmitter(context).emit(element.else_!, output);

      output.write(' }');
    }

    return output;
  }
}

/// {@template if_clause_emitter}
/// Emits the [IfClause] configuration into Dart source code.
/// {@endtemplate}
class IfClauseEmitter extends Emitter<IfClause> {
  /// {@macro if_clause_emitter}
  const IfClauseEmitter(super.context, this.if_);

  final If if_;

  @override
  StringSink emit(
    IfClause value, [
    StringSink? output,
  ]) {
    output ??= StringBuffer();

    if (value != if_.clauses.first) {
      output.write(' else ');
    }

    output.write('if (');

    ElementEmitter(context).emit(value.condition, output);

    output.write(') { ');

    if (value.body != null) {
      ElementEmitter(context).emit(value.body!, output);
    }

    output.write(' }');

    return output;
  }
}
