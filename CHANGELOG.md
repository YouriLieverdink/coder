# 2.0.0

- refactor!: change annotation to use TypeReference instead of String

# 1.9.0

- refactor: ensure all elements are equal by property
- feat: add an PrefixImporter

# 1.8.2

- test: expand importer with one test

# 1.8.1

- fix: ensure the importer works correctly

# 1.8.0

- feat: add an Importer which automatically resolves dependencies

# 1.7.0

- feat: add isToSuper property on Parameter

# 1.6.0

- refactor: emit semicolon instead of empty constructor body

# 1.5.2

- fix: also emit the default case of the switch element

# 1.5.1

- fix: resolve small mistakes with trailling commas

# 1.5.0

- feat: add the Annotation element

# 1.4.2

- feat: implement Method's MethodKind property

# 1.4.1

- fix: add parenthesis around the 'as' builder

# 1.4.0

- feat: add the ?? builder
- feat: add the declareTypedef builder
- feat: add constructor initializers

# 1.3.0

- feat: add the conditional builder

# 1.2.0

- refactor: deprecate propertyConditional for property

# 1.1.0

- feat: add ability to generate anonymous/lambda methods

# 1.0.0

- feat: initial release

# 0.19.0

- feat: add docs element

# 0.18.0

- refactor: merge for and while elements into loop element

# 0.17.0

- feat: add +=, \*=, /=, -=, %= builders

# 0.16.1

- fix: add missing directive and library emitters

# 0.16.0

- feat: add ability to generate a library

# 0.15.0

- refactor: add extra whitespace between elements

# 0.14.0

- feat: add ability to generate mixins
- feat: add ability to generate directives
- fix: trailling commas are now also placed on invocations
- ci: development branch is also run within workflow

# 0.13.0

- feat: add if-else clauses to if statements

# 0.12.0

- docs: update example and readme

# 0.11.0

- refactor: removal of copyWith methods

# 0.10.0

- feat: add option to generate a literal map

# 0.9.0

- refactor: allow builders to be called globally too
- refactor: expand the Literal element into multiple

# 0.8.1

- refactor: allow the bodies to be all elements

# 0.8.0

- refactor: rename call builder to invoke
- feat: add invocation element and allow arguments to be used

# 0.7.0

- refactor: replace binary element with a more flexible row element
- feat: add many, many more builder methods

# 0.6.0

- feat: add if-else statement
- feat: add switch statement
- feat: add try-catch-finally block
- feat: add while loop
- feat: add do-while loop
- feat: add for loop

# 0.5.0

- refactor: merge the elements and statements into one
- feat: add a builder mixin to allow chaining elements

# 0.4.0

- feat: add a spec emitter

# 0.3.1

- fix: allow classes to have methods

# 0.3.0

- chore: add example

# 0.2.0

- docs: add README and update inline documentation
- feat: extension generation
- feat: use of trailling commas
- ci: analyze, format, and test workflow
- refactor: change statement implementation

# 0.1.0

- feat: enum generation
- feat: class, constructor, field, and method generation
- feat: type reference and function reference
