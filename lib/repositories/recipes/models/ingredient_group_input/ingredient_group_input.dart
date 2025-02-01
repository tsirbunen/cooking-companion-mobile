import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/repositories/recipes/models/ingredient_input/ingredient_input.dart';

part 'ingredient_group_input.freezed.dart';
part 'ingredient_group_input.g.dart';

@freezed
class IngredientGroupInput with _$IngredientGroupInput {
  @JsonSerializable(explicitToJson: true)
  const factory IngredientGroupInput({
    String? title,
    required List<IngredientInput> ingredients,
  }) = _IngredientGroupInput;

  factory IngredientGroupInput.fromJson(Map<String, Object?> json) =>
      _$IngredientGroupInputFromJson(json);
}
