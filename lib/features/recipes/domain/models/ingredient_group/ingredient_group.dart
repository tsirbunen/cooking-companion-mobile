import 'package:freezed_annotation/freezed_annotation.dart';
import '../ingredient/ingredient.dart';

part 'ingredient_group.freezed.dart';
part 'ingredient_group.g.dart';

@freezed
class IngredientGroup with _$IngredientGroup {
  @JsonSerializable(explicitToJson: true)
  const factory IngredientGroup({
    required int id,
    String? title,
    required List<Ingredient> ingredients,
  }) = _IngredientGroup;

  factory IngredientGroup.fromJson(Map<String, Object?> json) =>
      _$IngredientGroupFromJson(json);
}
