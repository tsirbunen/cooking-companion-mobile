import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/repositories_and_data/models/ingredient_group_input/ingredient_group_input.dart';
import 'package:mobile/repositories_and_data/models/instruction_group_input/instruction_group_input.dart';

part 'patch_recipe_input.freezed.dart';
part 'patch_recipe_input.g.dart';

@freezed
class PatchRecipeInput with _$PatchRecipeInput {
  @JsonSerializable(explicitToJson: true)
  const factory PatchRecipeInput({
    required int recipeId,
    required List<String> fieldsToInclude,
    String? title,
    String? language,
    bool? ovenNeeded,
    String? description,
    // List<String>? photos,
    List<String>? tags,
    List<IngredientGroupInput>? ingredientGroups,
    List<InstructionGroupInput>? instructionGroups,
  }) = _PatchRecipeInput;

  factory PatchRecipeInput.fromJson(Map<String, Object?> json) =>
      _$PatchRecipeInputFromJson(json);
}
