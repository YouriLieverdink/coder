![Continuous Integration](https://github.com/YouriLieverdink/orchestrator/actions/workflows/ci.yaml/badge.svg)
[![pub package](https://img.shields.io/pub/v/orchestrator.svg)](https://pub.dev/packages/orchestrator)

Easily define code structures in Dart using a Flutter widget like syntax.

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
