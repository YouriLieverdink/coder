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
          const left = LiteralNum(42);
          const right = LiteralNum(8);

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
        'should emit an add assign operation',
        () {
          const left = LiteralNum(42);
          const right = LiteralNum(8);

          final operation = addAssign(left, right);

          Expect(
            operation,
            const Equals(
              '''
                42 += 8
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit an and operation',
        () {
          const left = LiteralString('cat');
          const right = LiteralString('dog');

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
          const left = LiteralString('cat');
          const right = LiteralString('dog');

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
          const left = LiteralString('cat');
          const right = LiteralString('dog');

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
          const left = LiteralString('cat');
          const right = LiteralString('dog');

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
        'should emit an awaited operation',
        () {
          const left = Static('cat');

          final operation = left.awaited;

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
        'should emit a conditional operation',
        () {
          const left = Static('cat');
          const middle = Static('true');
          const right = Static('false');

          final operation = left.conditional(middle, right);

          Expect(
            operation,
            const Equals(
              '''
                cat ? true : false
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a declare const operation',
        () {
          const left = Static('cat');

          final operation = left.declareConst;

          Expect(
            operation,
            const Equals(
              '''
                const cat
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a declare final operation',
        () {
          const left = Static('cat');

          final operation = left.declareFinal;

          Expect(
            operation,
            const Equals(
              '''
                final cat
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a declare type operation',
        () {
          const left = Static('cat');

          final operation = left.declareType(const TypeReference('Cat'));

          Expect(
            operation,
            const Equals(
              '''
                Cat cat
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a declare typedef operation',
        () {
          const a = Static('cat');

          final operation = declareTypedef(a);

          Expect(
            operation,
            const Equals(
              '''
                typedef cat
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a declare var operation',
        () {
          const left = Static('cat');

          final operation = left.declareVar;

          Expect(
            operation,
            const Equals(
              '''
                var cat
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
          const left = LiteralNum(42);
          const right = LiteralNum(8);

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
        'should emit a divide assign operation',
        () {
          const left = LiteralNum(42);
          const right = LiteralNum(8);

          final operation = divideAssign(left, right);

          Expect(
            operation,
            const Equals(
              '''
                42 /= 8
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a equal to operation',
        () {
          const left = LiteralString('cat');
          const right = LiteralString('dog');

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
          const left = LiteralString('cat');
          const right = LiteralString('dog');

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
          const left = LiteralString('cat');
          const right = LiteralString('dog');

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
          const left = LiteralString('cat');
          const right = LiteralString('dog');

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
          const left = LiteralString('cat');
          const right = LiteralString('dog');

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
        'should emit an in operation',
        () {
          const left = Static('cats');
          const right = LiteralList(['cats', 'dogs']);

          final operation = left.in_(right);

          Expect(
            operation,
            const Equals(
              '''
                cats in ['cats', 'dogs']
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
          const right = LiteralNum(0);

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
          const left = LiteralString('cat');
          const right = LiteralString('dog');

          final operation = left.isA(right);

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
          const left = LiteralString('cat');
          const right = LiteralString('dog');

          final operation = left.isNotA(right);

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
          const left = LiteralNum(42);
          const right = LiteralNum(8);

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
        'should emit an modulo assign operation',
        () {
          const left = LiteralNum(42);
          const right = LiteralNum(8);

          final operation = moduloAssign(left, right);

          Expect(
            operation,
            const Equals(
              '''
                42 %= 8
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit an multiply operation',
        () {
          const left = LiteralNum(42);
          const right = LiteralNum(8);

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
        'should emit an multiply assign operation',
        () {
          const left = LiteralNum(42);
          const right = LiteralNum(8);

          final operation = multiplyAssign(left, right);

          Expect(
            operation,
            const Equals(
              '''
                42 *= 8
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit a named argument',
        () {
          const left = LiteralString('Pip');

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
          const left = LiteralNum(42);

          final operation = left.negated;

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
          const left = LiteralString('cat');
          const right = LiteralString('dog');

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
          const left = LiteralString('cat');
          const right = LiteralString('dog');

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
        'should emit a null-safe property operation',
        () {
          const left = Static('cat');

          final operation = left.property('name', isNullSafe: true);

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

          final operation = left.returned;

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

          final operation = left.spread;

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
        'should emit a statement',
        () {
          const left = Static('cat');

          final operation = left.statement;

          Expect(
            operation,
            const Equals(
              '''
                cat;
              ''',
              emitter: emitter,
            ),
          );
        },
      );

      test(
        'should emit an subtract operation',
        () {
          const left = LiteralNum(42);
          const right = LiteralNum(8);

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
        'should emit a subtract assign operation',
        () {
          const left = LiteralNum(42);
          const right = LiteralNum(8);

          final operation = subtractAssign(left, right);

          Expect(
            operation,
            const Equals(
              '''
                42 -= 8
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

          final operation = left.thrown;

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

          final operation = left.yielded;

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
