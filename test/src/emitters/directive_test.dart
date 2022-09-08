import 'package:orchestrator/orchestrator.dart';
import 'package:test/test.dart';

import '../../utilities/utilities.dart';

void main() {
  const context = Context();
  const emitter = DirectiveEmitter(context);

  group(
    'DirectiveEmitter',
    () {
      test(
        'should emit an import directive',
        () {
          const element = Directive(
            url: 'dart:core',
            kind: DirectiveKind.import,
          );

          Expect(
            element,
            const Equals(
              '''
                import 'dart:core';
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit an export directive',
        () {
          const element = Directive(
            url: 'dart:core',
            kind: DirectiveKind.export,
          );

          Expect(
            element,
            const Equals(
              '''
                export 'dart:core';
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit an part directive',
        () {
          const element = Directive(
            url: 'dart:core',
            kind: DirectiveKind.part,
          );

          Expect(
            element,
            const Equals(
              '''
                part 'dart:core';
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit an part of directive',
        () {
          const element = Directive(
            url: 'dart:core',
            kind: DirectiveKind.partOf,
          );

          Expect(
            element,
            const Equals(
              '''
                part of 'dart:core';
              ''',
              emitter: emitter,
            ),
          );
        },
      );
    },
  );
}
