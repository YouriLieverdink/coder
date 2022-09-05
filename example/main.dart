import 'package:orchestrator/orchestrator.dart';

void main() {
  // Example of a Fibonacci method.
  final element = Column([
    Method(
      name: 'fibonacci',
      returns: const TypeReference('int'),
      parameters: [
        const Parameter(
          name: 'n',
          type: TypeReference('int'),
        ),
      ],
      // Use [Column]s to add multiple elements within a body.
      body: Column([
        If(
          clauses: [
            IfClause(
              condition: or(
                const Static('n').equalTo(Literal.of(0)),
                const Static('n').equalTo(Literal.of(1)),
              ),
              body: const Static('n') //
                  .returned
                  .statement,
            ),
          ],
        ),
        const Static(''),
        // Builders can be used as top level functions...
        add(
          invoke(
            const Static('fibonacci'),
            // ...or on the [Element]'s themselves.
            [const Static('n').subtract(Literal.of(1))],
          ),
          invoke(
            const Static('fibonacci'),
            [const Static('n').subtract(Literal.of(2))],
          ),
        ).returned.statement,
      ]),
    ),
    const Static(''),
    const Static('result') //
        .declareVar
        .assign(const Static('fibonacci').invoke([Literal.of(20)]))
        .statement,
  ]);

  // Each element has their own [Emitter], this one can be used for (almost) all.
  final context = Context();
  final emitter = ElementEmitter(context);

  emitter.emit(element);
}
