library utilities;

import 'package:orchestrator/orchestrator.dart';

const package = r'^package:.*\.dart$';
const dart = r'^dart:.*$';
const relative = r'^\.+\/.*\.dart$';

List<Directive> sortDirectives(
  List<Directive> directives,
) {
  //
  int order(
    Directive directive,
  ) {
    if (directive.kind == DirectiveKind.import) {
      // There are three different types of imports.
      if (RegExp(dart).hasMatch(directive.url)) {
        return -3;
      }

      if (RegExp(package).hasMatch(directive.url)) {
        return -2;
      }

      if (RegExp(relative).hasMatch(directive.url)) {
        return -1;
      }
    }

    return directive.kind.index;
  }

  directives.sort((a, b) {
    //
    final sort = order(a) - order(b);

    if (sort == 0) {
      // When the directives are the same, sort alpabetically.
      return a.url.compareTo(b.url);
    }

    return sort;
  });

  return directives;
}
