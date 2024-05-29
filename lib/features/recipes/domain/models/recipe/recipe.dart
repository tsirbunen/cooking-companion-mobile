import 'package:freezed_annotation/freezed_annotation.dart';
import '../ingredient_group/ingredient_group.dart';
import '../instruction_group/instruction_group.dart';
import '../language/language.dart';
import '../photo/photo.dart';
import '../tag/tag.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

@freezed
class Recipe with _$Recipe {
  const factory Recipe({
    required int id,
    required String title,
    required Language language,
    required bool ovenNeeded,
    String? description,
    List<Photo>? photos,
    List<Tag>? tags,
    required List<IngredientGroup> ingredientGroups,
    required List<InstructionGroup> instructionGroups,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, Object?> json) => _$RecipeFromJson(json);
}
