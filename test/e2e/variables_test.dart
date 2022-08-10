import 'package:orchestrator/orchestrator.dart';
import 'package:test/test.dart';

import '../utilities/utilities.dart';

void main() {
  const context = Context();
  const emitter = ElementEmitter(context);

  test(
    'should emit the Dart variables sample',
    () {
      final element = Column([
        const Static('name') //
            .declareVar
            .assign(Literal.of('Voyager I'))
            .statement,
        const Static('year') //
            .declareVar
            .assign(Literal.of(1977))
            .statement,
        const Static('antennaDiameter') //
            .declareVar
            .assign(Literal.of(3.7))
            .statement,
        const Static('flybyObjects') //
            .declareVar
            .assign(Literal.of(['Jupiter', 'Saturn', 'Uranus', 'Neptune']))
            .statement,
        const Static('image') //
            .declareVar
            .assign(
              Literal.of({
                'tags': ['saturn'],
                'url': '//path/to/saturn.jpg'
              }),
            )
            .statement,
      ]);

      Expect(
        element,
        const Equals(
          '''
            var name = 'Voyager I';
            var year = 1977;
            var antennaDiameter = 3.7;
            var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
            var image = {
              'tags': ['saturn'],
              'url': '//path/to/saturn.jpg'
            };
          ''',
          emitter: emitter,
        ),
      );
    },
  );
}
