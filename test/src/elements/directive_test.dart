import 'package:orchestrator/orchestrator.dart';
import 'package:test/test.dart';

void main() {
  final a = Directive.import('dart:core');
  final b = Directive.import('dart:async');
  final c = Directive.import('package:test/test.dart');
  final d = Directive.import('package:equatable/equatable.dart');
  final e = Directive.part('cat_state.dart');
  final f = Directive.partOf('cat_bloc.dart');
  final g = Directive.export('./utilities.dart');
  final h = Directive.export('./models.dart');

  group(
    'Directive',
    () {
      test(
        'implements Comparable correctly',
        () {
          final directives = [f, c, a, e, h, b, d, g];

          directives.sort();

          expect(
            directives,
            equals([b, a, d, c, e, f, h, g]),
          );
        },
      );
    },
  );
}
