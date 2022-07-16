![Continuous Integration](https://github.com/YouriLieverdink/orchestrator/actions/workflows/ci.yaml/badge.svg)
[![pub package](https://img.shields.io/pub/v/orchestrator.svg)](https://pub.dev/packages/orchestrator)

Easily define complex code structures in Dart using many out-of-the-box elements.

## Usage

Simple example of generating a class.

```dart
void main() {
  final element = Method(
    name: 'main',
    body: const Static('print')
        .invoke([Literal.of('Hello, World!')])
        .statement,
  );

  const context = Context();
  const emitter = ElementEmitter(context);

  emitter.emit(element);
}
```

Results in:

```dart
void main() {
  print('Hello, World!');
}
```
