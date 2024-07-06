import 'package:mobile/layers/business_logic/wizard/wizard_event.dart';
import 'package:mobile/layers/business_logic/wizard/wizard_state.dart';
import 'package:mobile/layers/repository/models/create_recipe_input/create_recipe_input.dart';
import 'package:mobile/layers/repository/models/ingredient_group_input/ingredient_group_input.dart';
import 'package:mobile/layers/repository/models/ingredient_input/ingredient_input.dart';
import 'package:mobile/layers/repository/models/instruction_group_input/instruction_group_input.dart';

bool shouldNeglectEvent<T>(WizardListEvent event, List<T> list) {
  return event.index < 0 || event.index > list.length;
}

List<T> updateList<T>(WizardListEvent event, List<T> list) {
  final isEmpty = event.isEmpty();

  if (event.index >= list.length) {
    if (isEmpty) return list;

    list.add(event.toElement());
    return list;
  }

  if (isEmpty) {
    list.removeAt(event.index);
  } else {
    list[event.index] = event.toElement();
  }

  return list;
}

bool canAndShouldRemoveItem(bool? clearItem, int? index, List<Object>? items) {
  if (clearItem == null || index == null || !clearItem) return false;
  if (items == null || items.isEmpty || index >= items.length) return false;
  return true;
}

CreateRecipeInput? getCreateRecipeInput(WizardState state) {
  if (state.title == null || state.title!.isEmpty) return null;
  if (state.ingredients == null || state.instructions == null) return null;

  return CreateRecipeInput(
    title: state.title!,
    language: state.language ?? 'English',
    ovenNeeded: state.ovenNeeded != null ? state.ovenNeeded! : false,
    description: state.description,
    tags: state.tags?.map((e) => e.content).toList(),
    ingredientGroups: [getIngredientGroupInput(state.ingredients!)],
    instructionGroups: [getInstructionGroupInput(state.instructions!)],
  );
}

IngredientGroupInput getIngredientGroupInput(
    List<IngredientElement> ingredients) {
  return IngredientGroupInput(
      title: null,
      ingredients: ingredients
          .map((e) => IngredientInput(
                name: e.content,
                amount: e.amount,
                unit: e.unit,
              ))
          .toList());
}

InstructionGroupInput getInstructionGroupInput(
    List<InstructionElement> instructions) {
  return InstructionGroupInput(
    title: null,
    instructions: instructions.map((e) => e.content).toList(),
  );
}
