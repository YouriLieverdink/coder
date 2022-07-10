![Continuous Integration](https://github.com/YouriLieverdink/coder/actions/workflows/ci.yaml/badge.svg)

# Orchestrator

A Dart package which can be used to programatically generate Dart code.

## Usage

Simple example of generating a class.

```dart
void main() {
  const element = Class(
    name: 'Cat',
  );

  const context = Context();
  const emitter = ClassEmitter(context);

  emitter.emit(element);
}
```

Results in:

```dart
class Cat {}
```
