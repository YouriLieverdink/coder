import 'package:orchestrator/orchestrator.dart';
import 'package:test/test.dart';

import '../../utilities/utilities.dart';

void main() {
  const context = Context();

  group(
    'SwitchEmitter',
    () {
      const emitter = SwitchEmitter(context);

      test(
        'should emit a switch',
        () {
          const element = Switch(
            Static('cat.state'),
          );

          Expect(
            element,
            const Equals(
              '''
                switch (cat.state) {
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
      const emitter = SwitchCaseEmitter(context);

      test(
        'should emit a switch case',
        () {
          const element = SwitchCase(
            TypeReference('CatState.sleeping'),
            body: [
              Static('print("zzz");'),
              Static('break;'),
            ],
          );

          Expect(
            element,
            const Equals(
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
