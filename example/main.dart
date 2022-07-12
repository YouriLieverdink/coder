import 'package:orchestrator/orchestrator.dart';

void main() {
  const element = Class(
    name: 'Cat',
    extends_: TypeReference('Animal'),
    constructors: [
      Constructor(
        isConst: true,
        parameters: [
          Parameter(
            name: 'name',
            isToThis: true,
          ),
          Parameter(
            name: 'state',
            isToThis: true,
            assign: Static('CatState.eating'),
          ),
        ],
      ),
    ],
    fields: [
      Field(
        name: 'name',
        type: TypeReference('String'),
        modifier: FieldModifier.final_,
      ),
      Field(
        name: 'state',
        type: TypeReference('CatState'),
        modifier: FieldModifier.final_,
      ),
    ],
  );

  const context = Context(useTraillingCommas: true);
  const emitter = ClassEmitter(context);

  emitter.emit(element);
}
