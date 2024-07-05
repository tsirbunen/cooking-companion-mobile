import 'package:equatable/equatable.dart';
import 'package:mobile/layers/business_logic/wizard/utils.dart';
import 'package:mobile/layers/business_logic/wizard/wizard_event.dart';

class WizardState extends Equatable {
  final String? title;
  final bool? ovenNeeded;
  final String? description;
  final String? language;
  final List<TagElement>? tags;
  final List<IngredientElement>? ingredients;
  final List<InstructionElement>? instructions;

  const WizardState({
    this.title,
    this.ovenNeeded,
    this.description,
    this.language,
    this.tags,
    this.ingredients,
    this.instructions,
  });

  WizardState copyWith({
    String? newTitle,
    bool? newOvenNeeded,
    String? newDescription,
    String? newLanguage,
    List<TagElement>? newTags,
    List<IngredientElement>? newIngredients,
    List<InstructionElement>? newInstructions,
  }) {
    return WizardState(
      title: newTitle ?? title,
      ovenNeeded: newOvenNeeded ?? ovenNeeded,
      description: newDescription ?? description,
      language: newLanguage ?? language,
      tags: newTags ?? tags,
      ingredients: newIngredients ?? ingredients,
      instructions: newInstructions ?? instructions,
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
    );
  }

  @override
  List<Object?> get props => [
        title,
        ovenNeeded,
        description,
        language,
        tags,
        ingredients,
        instructions,
      ];
}
