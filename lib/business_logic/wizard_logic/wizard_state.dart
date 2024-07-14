import 'package:equatable/equatable.dart';
import 'package:mobile/app_services/logger/logger.dart';
import 'package:mobile/business_logic/models/bloc_status/bloc_status.dart';
import 'package:mobile/business_logic/models/recipe/recipe.dart';
import 'package:mobile/business_logic/wizard_logic/utils.dart';
import 'package:mobile/business_logic/wizard_logic/wizard_event.dart';

// FIXME: Implement actual ingredient and instruction groups. Currently recipes with
// only one ingredient group and one instruction group are supported.
const String onlyOneGroupSupportedMessage =
    'Currently only one ingredient group and one instruction group supported!';

class WizardState extends Equatable {
  final BlocStatus status;
  final int? id;
  final String? title;
  final bool? ovenNeeded;
  final String? description;
  final String? language;
  final List<TagElement>? tags;
  final List<IngredientElement>? ingredients;
  final List<InstructionElement>? instructions;
  final Recipe? originalRecipe;
  // FIXME: Implement hasChanges field

  const WizardState({
    this.status = BlocStatus.ok,
    this.id,
    this.title,
    this.ovenNeeded,
    this.description,
    this.language,
    this.tags,
    this.ingredients,
    this.instructions,
    this.originalRecipe,
  });

  WizardState? copyWithRecipe(Recipe recipe) {
    if (recipe.ingredientGroups.length > 1 ||
        recipe.instructionGroups.length > 1) {
      logger.warning(onlyOneGroupSupportedMessage, runtimeType);
      return null;
    }

    return WizardState(
      status: BlocStatus.ok,
      id: recipe.id,
      title: recipe.title,
      ovenNeeded: recipe.ovenNeeded,
      description: recipe.description,
      language: recipe.language.language,
      tags: (recipe.tags ?? [])
          .map((tag) => (content: tag.tag, id: tag.id))
          .toList(),
      ingredients: recipe.ingredientGroups[0].ingredients.map((ingredient) {
        return (
          id: ingredient.id,
          amount: ingredient.amount,
          unit: ingredient.unit,
          content: ingredient.name
        );
      }).toList(),
      instructions: recipe.instructionGroups[0].instructions.map((instruction) {
        return (id: instruction.id, content: instruction.content);
      }).toList(),
      originalRecipe: recipe,
    );
  }

  WizardState copyWith({
    BlocStatus? newStatus,
    int? newId,
    String? newTitle,
    bool? newOvenNeeded,
    String? newDescription,
    String? newLanguage,
    List<TagElement>? newTags,
    List<IngredientElement>? newIngredients,
    List<InstructionElement>? newInstructions,
    Recipe? newOriginalRecipe,
  }) {
    return WizardState(
      status: newStatus ?? status,
      id: newId ?? id,
      title: newTitle ?? title,
      ovenNeeded: newOvenNeeded ?? ovenNeeded,
      description: newDescription ?? description,
      language: newLanguage ?? language,
      tags: newTags ?? tags,
      ingredients: newIngredients ?? ingredients,
      instructions: newInstructions ?? instructions,
      originalRecipe: newOriginalRecipe ?? originalRecipe,
    );
  }

  WizardState copyWithClearField({
    bool? clearTitle,
    bool? clearOvenNeeded,
    bool? clearDescription,
    bool? clearLanguage,
    bool? clearTag,
    int? tagIndex,
    bool? clearIngredient,
    int? ingredientIndex,
    bool? clearInstruction,
    int? instructionIndex,
  }) {
    return WizardState(
      status: status,
      id: id,
      title: clearTitle != null && clearTitle ? null : title,
      ovenNeeded:
          clearOvenNeeded != null && clearOvenNeeded ? null : ovenNeeded,
      description:
          clearDescription != null && clearDescription ? null : description,
      language: clearLanguage != null && clearLanguage ? null : language,
      tags: canAndShouldRemoveItem(clearTag, tagIndex, tags)
          ? tags!.removeAt(tagIndex!) as List<TagElement>
          : tags,
      ingredients: canAndShouldRemoveItem(
              clearIngredient, ingredientIndex, ingredients)
          ? ingredients!.removeAt(ingredientIndex!) as List<IngredientElement>
          : ingredients,
      instructions: canAndShouldRemoveItem(
              clearInstruction, instructionIndex, instructions)
          ? instructions!.removeAt(instructionIndex!)
              as List<InstructionElement>
          : instructions,
      originalRecipe: originalRecipe,
    );
  }

  @override
  List<Object?> get props => [
        status,
        id,
        title,
        ovenNeeded,
        description,
        language,
        tags,
        ingredients,
        instructions,
        originalRecipe,
      ];
}
