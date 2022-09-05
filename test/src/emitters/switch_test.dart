import 'package:orchestrator/orchestrator.dart';
import 'package:test/test.dart';

import '../../utilities/utilities.dart';

void main() {
  final context = Context();

  group(
    'SwitchEmitter',
    () {
      final emitter = SwitchEmitter(context);

      test(
        'should emit a switch',
        () {
          const element = Switch(
            condition: Static('cat.state'),
          );

          Expect(
            element,
            Equals(
              '''
                switch (cat.state) {
                }
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a switch with spaced out cases',
        () {
          const element = Switch(
            condition: Static('cat.state'),
            cases: [
              SwitchCase(
                condition: Static('CatState.sleeping'),
                body: Column([
                  Static('print("zzz");'),
                  Static('break;'),
                ]),
              ),
              SwitchCase(
                condition: Static('CatState.eating'),
                body: Column([
                  Static('print("mmm");'),
                  Static('break;'),
                ]),
              ),
            ],
          );

          Expect(
            element,
            Equals(
              '''
                switch (cat.state) {
                  case CatState.sleeping:
                    print("zzz");
                    break;

                  case CatState.eating:
                    print("mmm");
                    break;
                }
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a switch with a default case',
        () {
          const element = Switch(
            condition: Static('cat.state'),
            default_: Column([
              Static('print("mmm");'),
              Static('break;'),
            ]),
          );

          Expect(
            element,
            Equals(
              '''
                switch (cat.state) {
                  default:
                    print("mmm");
                    break;
                } 
              ''',
              emitter: emitter,
            ),
          );
        },
      );
    },
  );

  group(
    'SwitchCaseEmitter',
    () {
      final emitter = SwitchCaseEmitter(context);

      test(
        'should emit a switch case',
        () {
          const element = SwitchCase(
            condition: TypeReference('CatState.sleeping'),
            body: Column([
              Static('print("zzz");'),
              Static('break;'),
            ]),
          );

          Expect(
            element,
            Equals(
              '''
                case CatState.sleeping:
                    print("zzz");
                    break; 
              ''',
              emitter: emitter,
            ),
          );
        },
      );
    },
  );
}
