import 'package:orchestrator/orchestrator.dart';
import 'package:test/test.dart';

import '../../utilities/utilities.dart';

void main() {
  const context = Context();
  const emitter = IfEmitter(context);

  group(
    'IfEmitter',
    () {
      test(
        'should emit an if statement',
        () {
          const element = If(
            clauses: [
              IfClause(
                condition: LiteralBool(true),
                body: Static('print("true!");'),
              ),
            ],
          );

          Expect(
            element,
            const Equals(
              '''
                if (true) {
                  print("true!");
                }
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit an if statement with an else if clause',
        () {
          const element = If(
            clauses: [
              IfClause(
                condition: LiteralBool(true),
                body: Static('print("true!");'),
              ),
              IfClause(
                condition: LiteralBool(false),
                body: Static('print("false!");'),
              ),
            ],
          );

          Expect(
            element,
            const Equals(
              '''
                if (true) {
                  print("true!");
                } else if (false) {
                  print("false!");
                }
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit an if statement with an else block',
        () {
          const element = If(
            clauses: [
              IfClause(
                condition: LiteralBool(true),
                body: Static('print("true!");'),
              ),
            ],
            else_: Static('print("not true!");'),
          );

          Expect(
            element,
            const Equals(
              '''
                if (true) {
                  print("true!");
                } else {
                  print("not true!");
                }
              ''',
              emitter: emitter,
            ),
          );
        },
      );
    },
  );

  // group(
  //   'IfElseEmitter',
  //   () {
  //     test(
  //       'should emit an if',
  //       () {
  //         const element = If(
  //           clause: Static('i > 42'),
  //           then: Column([
  //             Static("print('Found the meaning of life!');"),
  //           ]),
  //         );

  //         Expect(
  //           element,
  //           const Equals(
  //             '''
  //               if (i > 42) {
  //                 print('Found the meaning of life!');
  //               }
  //             ''',
  //             emitter: emitter,
  //           ),
  //         );
  //       },
  //     );

  //     test(
  //       'should emit an if element with an else block',
  //       () {
  //         const statement = If(
  //           clause: Static('i > 42'),
  //           then: Column([
  //             Static("print('Found the meaning of life!');"),
  //           ]),
  //           else_: Column([
  //             Static("print('Not yet!');"),
  //           ]),
  //         );

  //         Expect(
  //           statement,
  //           const Equals(
  //             '''
  //               if (i > 42) {
  //                 print('Found the meaning of life!');
  //               } else {
  //                 print('Not yet!');
  //               }
  //             ''',
  //             emitter: emitter,
  //           ),
  //         );
  //       },
  //     );
  //   },
  // );
}
