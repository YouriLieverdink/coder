import 'package:orchestrator/orchestrator.dart';
import 'package:test/test.dart';

import '../utilities/utilities.dart';

void main() {
  const context = Context();
  const emitter = ElementEmitter(context);

  group(
    'Builder',
    () {
      test(
        'should emit an add operation',
        () {
          const left = Literal(42);
          const right = Literal(8);

          final operation = left.add(right);

          Expect(
            operation,
            const Equals(
              '''
                42 + 8
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit an and operation',
        () {
          const left = Literal('cat');
          const right = Literal('dog');

          final operation = left.and(right);

          Expect(
            operation,
            const Equals(
              '''
                'cat' && 'dog'
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit an as operation',
        () {
          const left = Literal('cat');
          const right = Literal('dog');

          final operation = left.as(right);

          Expect(
            operation,
            const Equals(
              '''
                'cat' as 'dog'
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit an assign operation',
        () {
          const left = Literal('cat');
          const right = Literal('dog');

          final operation = left.assign(right);

          Expect(
            operation,
            const Equals(
              '''
                'cat' = 'dog'
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit an assign coalescing operation',
        () {
          const left = Literal('cat');
          const right = Literal('dog');

          final operation = left.assignCoalescing(right);

          Expect(
            operation,
            const Equals(
              '''
                'cat' ??= 'dog'
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit an assign const operation',
        () {
          const left = Literal('cat');

          final operation = left.assignConst('myCat');

          Expect(
            operation,
            const Equals(
              '''
                const myCat = 'cat'
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit an assign final operation',
        () {
          const left = Literal('cat');

          final operation = left.assignFinal('myCat');

          Expect(
            operation,
            const Equals(
              '''
                final myCat = 'cat'
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit an assign var operation',
        () {
          const left = Literal('cat');

          final operation = left.assignVar('myCat');

          Expect(
            operation,
            const Equals(
              '''
                var myCat = 'cat'
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit an awaited operation',
        () {
          const left = Static('cat');

          final operation = left.await_();

          Expect(
            operation,
            const Equals(
              '''
                await cat
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit an invoke operation',
        () {
          const left = Static('Cat');

          final operation = left.invoke();

          Expect(
            operation,
            const Equals(
              '''
                Cat()
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit an divide operation',
        () {
          const left = Literal(42);
          const right = Literal(8);

          final operation = left.divide(right);

          Expect(
            operation,
            const Equals(
              '''
                42 / 8
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a equal to operation',
        () {
          const left = Literal('cat');
          const right = Literal('dog');

          final operation = left.equalTo(right);

          Expect(
            operation,
            const Equals(
              '''
                'cat' == 'dog'
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a greater than operation',
        () {
          const left = Literal('cat');
          const right = Literal('dog');

          final operation = left.greaterThan(right);

          Expect(
            operation,
            const Equals(
              '''
                'cat' > 'dog'
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a reversed greater than operation',
        () {
          const left = Literal('cat');
          const right = Literal('dog');

          final operation = left.greaterThan(right, reverse: true);

          Expect(
            operation,
            const Equals(
              '''
                'cat' < 'dog'
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a greater than or equal operation',
        () {
          const left = Literal('cat');
          const right = Literal('dog');

          final operation = left.greaterThanOrEqualTo(right);

          Expect(
            operation,
            const Equals(
              '''
                'cat' >= 'dog'
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a reversed greater than or equal operation',
        () {
          const left = Literal('cat');
          const right = Literal('dog');

          final operation = left.greaterThanOrEqualTo(right, reverse: true);

          Expect(
            operation,
            const Equals(
              '''
                'cat' <= 'dog'
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit an index operation',
        () {
          const left = Static('cats');
          const right = Literal(0);

          final operation = left.index(right);

          Expect(
            operation,
            const Equals(
              '''
                cats[0]
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit an is operation',
        () {
          const left = Literal('cat');
          const right = Literal('dog');

          final operation = left.is_(right);

          Expect(
            operation,
            const Equals(
              '''
                'cat' is 'dog'
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit an is not operation',
        () {
          const left = Literal('cat');
          const right = Literal('dog');

          final operation = left.isNot(right);

          Expect(
            operation,
            const Equals(
              '''
                'cat' is! 'dog'
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit an modulo operation',
        () {
          const left = Literal(42);
          const right = Literal(8);

          final operation = left.modulo(right);

          Expect(
            operation,
            const Equals(
              '''
                42 % 8
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit an multiply operation',
        () {
          const left = Literal(42);
          const right = Literal(8);

          final operation = left.multiply(right);

          Expect(
            operation,
            const Equals(
              '''
                42 * 8
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a named argument',
        () {
          const left = Literal('Pip');

          final operation = left.named('name');

          Expect(
            operation,
            const Equals(
              '''
                name: 'Pip'
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a negate operation',
        () {
          const left = Literal(42);

          final operation = left.negate();

          Expect(
            operation,
            const Equals(
              '''
                !42
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a not equal to operation',
        () {
          const left = Literal('cat');
          const right = Literal('dog');

          final operation = left.notEqualTo(right);

          Expect(
            operation,
            const Equals(
              '''
                'cat' != 'dog'
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a not equal to operation',
        () {
          const left = Literal('cat');
          const right = Literal('dog');

          final operation = left.or(right);

          Expect(
            operation,
            const Equals(
              '''
                'cat' || 'dog'
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a property operation',
        () {
          const left = Static('cat');

          final operation = left.property('name');

          Expect(
            operation,
            const Equals(
              '''
                cat.name
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a property asserted',
        () {
          const left = Static('cat');

          final operation = left.propertyAssert('name');

          Expect(
            operation,
            const Equals(
              '''
                cat!.name
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a property cascaded',
        () {
          const left = Static('cat');

          final operation = left.propertyCascade('name');

          Expect(
            operation,
            const Equals(
              '''
                cat..name
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a property conditional operation',
        () {
          const left = Static('cat');

          final operation = left.propetyConditional('name');

          Expect(
            operation,
            const Equals(
              '''
                cat?.name
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit an returned operation',
        () {
          const left = Static('cat');

          final operation = left.return_();

          Expect(
            operation,
            const Equals(
              '''
                return cat
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit an spread operation',
        () {
          const left = Static('cat');

          final operation = left.spread();

          Expect(
            operation,
            const Equals(
              '''
                ...cat
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit an subtract operation',
        () {
          const left = Literal(42);
          const right = Literal(8);

          final operation = left.subtract(right);

          Expect(
            operation,
            const Equals(
              '''
                42 - 8
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit an thrown operation',
        () {
          const left = Static('cat');

          final operation = left.throw_();

          Expect(
            operation,
            const Equals(
              '''
                throw cat
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit an yielded operation',
        () {
          const left = Static('cat');

          final operation = left.yield_();

          Expect(
            operation,
            const Equals(
              '''
                yield cat
              ''',
              emitter: emitter,
            ),
          );
        },
      );
    },
  );
}
