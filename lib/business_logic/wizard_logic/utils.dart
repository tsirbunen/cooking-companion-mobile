import 'package:mobile/business_logic/models/ingredient_group/ingredient_group.dart';
import 'package:mobile/business_logic/models/instruction_group/instruction_group.dart';
import 'package:mobile/business_logic/models/recipe/recipe.dart';
import 'package:mobile/business_logic/models/tag/tag.dart';
import 'package:mobile/business_logic/wizard_logic/wizard_event.dart';
import 'package:mobile/business_logic/wizard_logic/wizard_state.dart';
import 'package:mobile/repositories/recipes/models/create_recipe_input/create_recipe_input.dart';
import 'package:mobile/repositories/recipes/models/ingredient_group_input/ingredient_group_input.dart';
import 'package:mobile/repositories/recipes/models/ingredient_input/ingredient_input.dart';
import 'package:mobile/repositories/recipes/models/instruction_group_input/instruction_group_input.dart';
import 'package:mobile/repositories/recipes/models/patch_recipe_input/patch_recipe_input.dart';

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

bool getTagsHaveChanged(List<TagElement>? tags, List<Tag>? originalTags) {
  final hasTags = tags != null && tags.isNotEmpty;
  final hasOriginalTags = originalTags != null && originalTags.isNotEmpty;
  if (!hasTags && !hasOriginalTags) return false;
  if (!hasTags && hasOriginalTags || hasTags && !hasOriginalTags) return true;
  if (tags!.length != originalTags!.length) return true;

  final originalTagTags = originalTags.map((e) => e.tag);
  for (final tag in tags) {
    if (!originalTagTags.contains(tag.content)) return true;
  }
  return false;
}

bool getIngredientsHaveChanged(
  List<IngredientElement>? ingredients,
  List<IngredientGroup>? originalIngredientGroups,
) {
  // FIXME: Currently only one ingredient group is supported -> support multiple!

  final hasIngredients = ingredients != null && ingredients.isNotEmpty;
  final hasOriginalIngredients =
      originalIngredientGroups != null && originalIngredientGroups.isNotEmpty;
  if (!hasIngredients && !hasOriginalIngredients) return false;
  if (!hasIngredients && hasOriginalIngredients ||
      hasIngredients && !hasOriginalIngredients) return true;
  if (ingredients!.length != originalIngredientGroups!.length) return true;

  final originalsAsStrings = originalIngredientGroups[0]
      .ingredients
      .map((e) => '${e.name} ${e.amount} ${e.unit}');
  final ingredientsAsStrings =
      ingredients.map((e) => '${e.content} ${e.amount} ${e.unit}');
  for (final ingredient in ingredientsAsStrings) {
    if (!originalsAsStrings.contains(ingredient)) return true;
  }
  return false;
}

bool getInstructionsHaveChanged(
  List<InstructionElement>? instructions,
  List<InstructionGroup>? originalInstructionGroups,
) {
  // FIXME: Currently only one instruction group is supported -> support multiple!
  final originalInstructions = originalInstructionGroups?[0].instructions;
  final hasInstructions = instructions != null && instructions.isNotEmpty;
  final hasOriginalInstructions =
      originalInstructions != null && originalInstructions.isNotEmpty;
  if (!hasInstructions && !hasOriginalInstructions) return false;
  if (!hasInstructions && hasOriginalInstructions ||
      hasInstructions && !hasOriginalInstructions) return true;
  if (instructions!.length != originalInstructions!.length) return true;

  final originalContents = originalInstructions.map((e) => e.content);
  final contents = instructions.map((e) => e.content);
  for (final content in contents) {
    if (!originalContents.contains(content)) return true;
  }
  return false;
}

PatchRecipeInput? getPatchRecipeInput(WizardState state) {
  final Recipe original = state.originalRecipe!;
  final fieldsToInclude = [
    if (state.title != original.title) 'title',
    if (state.language != original.language.language) 'language',
    if (state.ovenNeeded != original.ovenNeeded) 'ovenNeeded',
    if (state.description != original.description) 'description',
    if (getTagsHaveChanged(state.tags, original.tags)) 'tags',
    if (getIngredientsHaveChanged(state.ingredients, original.ingredientGroups))
      'ingredientGroups',
    if (getInstructionsHaveChanged(
        state.instructions, original.instructionGroups))
      'instructionGroups',
  ];
  if (fieldsToInclude.isEmpty) return null;

  return PatchRecipeInput(
    recipeId: state.id!,
    fieldsToInclude: fieldsToInclude,
    title: state.title,
    language: state.language,
    ovenNeeded: state.ovenNeeded,
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
