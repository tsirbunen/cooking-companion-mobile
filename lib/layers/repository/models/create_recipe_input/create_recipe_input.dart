import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/layers/repository/models/ingredient_group_input/ingredient_group_input.dart';
import 'package:mobile/layers/repository/models/instruction_group_input/instruction_group_input.dart';

part 'create_recipe_input.freezed.dart';
part 'create_recipe_input.g.dart';

@freezed
class CreateRecipeInput with _$CreateRecipeInput {
  @JsonSerializable(explicitToJson: true)
  const factory CreateRecipeInput({
    required String title,
    required String language,
    required bool ovenNeeded,
    String? description,
    // List<String>? photos,
    List<String>? tags,
    required List<IngredientGroupInput> ingredientGroups,
    required List<InstructionGroupInput> instructionGroups,
  }) = _CreateRecipeInput;

  factory CreateRecipeInput.fromJson(Map<String, Object?> json) =>
      _$CreateRecipeInputFromJson(json);
}
