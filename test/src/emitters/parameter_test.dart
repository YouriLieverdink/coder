import 'package:orchestrator/orchestrator.dart';
import 'package:test/test.dart';

import '../../utilities/utilities.dart';

void main() {
  final context = Context();

  group(
    'ParameterEmitter',
    () {
      final emitter = ParameterEmitter(context);

      test(
        'should emit a parameter',
        () {
          const element = Parameter(
            type: TypeReference('dynamic'),
            name: 'state',
          );

          Expect(
            element,
            Equals(
              '''
                dynamic state 
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a parameter with a type',
        () {
          const element = Parameter(
            name: 'state',
            type: TypeReference('CatState'),
          );

          Expect(
            element,
            Equals(
              '''
                CatState state 
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a paremeter with an assignment',
        () {
          const element = Parameter(
            name: 'state',
            type: TypeReference('CatState'),
            assign: Static('CatState.purring'),
          );

          Expect(
            element,
            Equals(
              '''
                CatState state = CatState.purring
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a required parameter when named',
        () {
          const element = Parameter(
            name: 'state',
            type: TypeReference('CatState'),
            isRequired: true,
            kind: ParameterKind.named,
          );

          Expect(
            element,
            Equals(
              '''
                required CatState state
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a normal parameter when not named',
        () {
          const element = Parameter(
            name: 'state',
            type: TypeReference('CatState'),
            isRequired: true,
          );

          Expect(
            element,
            Equals(
              '''
                CatState state
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a to this parameter',
        () {
          const element = Parameter(
            name: 'state',
            isToThis: true,
          );

          Expect(
            element,
            Equals(
              '''
                this.state
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a to super parameter',
        () {
          const element = Parameter(
            name: 'state',
            isToSuper: true,
          );

          Expect(
            element,
            Equals(
              '''
                super.state
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a parameter with annotations',
        () {
          const element = Parameter(
            name: 'state',
            type: TypeReference('State'),
            annotations: [
              Annotation('Deprecated'),
            ],
          );

          Expect(
            element,
            Equals(
              '''
                @Deprecated State state
              ''',
              emitter: emitter,
            ),
          );
        },
      );
    },
  );

  group(
    'ParameterListEmitter',
    () {
      final emitter = ParameterListEmitter(context);

      test(
        'shoud emit a list of parameters',
        () {
          const elements = [
            Parameter(
              name: 'name',
              type: TypeReference('dynamic'),
            ),
            Parameter(
              name: 'state',
              type: TypeReference('dynamic'),
            ),
          ];

          Expect(
            elements,
            Equals(
              '''
                dynamic name, dynamic state
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a list of parameters without a trailling comma when one '
        'element is present',
        () {
          const elements = [
            Parameter(
              name: 'name',
              type: TypeReference('dynamic'),
            ),
          ];

          Expect(
            elements,
            Equals(
              '''
                dynamic name
              ''',
              emitter: ParameterListEmitter(
                Context(useTraillingCommas: true),
              ),
            ),
          );
        },
      );

      test(
        'should emit a list of parameters with a trailling comma when multiple '
        'elements are present',
        () {
          const elements = [
            Parameter(
              name: 'name',
              type: TypeReference('dynamic'),
            ),
            Parameter(
              name: 'state',
              type: TypeReference('dynamic'),
            ),
          ];

          Expect(
            elements,
            Equals(
              '''
                dynamic name, dynamic state,
              ''',
              emitter: ParameterListEmitter(
                Context(useTraillingCommas: true),
              ),
            ),
          );
        },
      );

      test(
        'should emit a list of named parameters',
        () {
          const elements = [
            Parameter(
              name: 'name',
              type: TypeReference('dynamic'),
              kind: ParameterKind.named,
            ),
            Parameter(
              name: 'state',
              type: TypeReference('dynamic'),
              kind: ParameterKind.named,
            ),
          ];

          Expect(
            elements,
            Equals(
              '''
                {dynamic name, dynamic state}
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a list of optional parameters',
        () {
          const elements = [
            Parameter(
              name: 'name',
              type: TypeReference('dynamic'),
              kind: ParameterKind.optional,
            ),
            Parameter(
              name: 'state',
              type: TypeReference('dynamic'),
              kind: ParameterKind.optional,
            ),
          ];

          Expect(
            elements,
            Equals(
              '''
                [dynamic name, dynamic state]
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a list of combined parameters',
        () {
          const elements = [
            Parameter(
              name: 'name',
              type: TypeReference('String'),
            ),
            Parameter(
              name: 'state',
              type: TypeReference('CatState'),
              kind: ParameterKind.named,
              isRequired: true,
            ),
            Parameter(
              name: 'birthday',
              type: TypeReference('DateTime', isNullable: true),
              kind: ParameterKind.named,
            ),
          ];

          Expect(
            elements,
            Equals(
              '''
                String name, {required CatState state, DateTime? birthday}
              ''',
              emitter: emitter,
            ),
          );
        },
      );
    },
  );
}
