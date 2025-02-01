import 'package:equatable/equatable.dart';
import 'package:mobile/business_logic/models/recipe/recipe.dart';

class CookState {
  final Map<int, Recipe> recipeMap;
  final List<int> pickedRecipeIds;
  final List<int> isCooking;
  final Map<int, List<int>> ingredientsAddedByRecipe;
  final Map<int, List<int>> instructionsDoneByRecipe;

  const CookState({
    required this.isCooking,
    required this.pickedRecipeIds,
    required this.recipeMap,
    required this.ingredientsAddedByRecipe,
    required this.instructionsDoneByRecipe,
  });

  CookState copyWith({
    final List<int>? newIsCooking,
    final List<int>? newPickedRecipeIds,
    final Map<int, Recipe>? newRecipeMap,
    final Map<int, List<int>>? newIngredientsAddedByRecipe,
    final Map<int, List<int>>? newInstructionsDoneByRecipe,
  }) {
    return CookState(
      isCooking: newIsCooking ?? isCooking,
      pickedRecipeIds: newPickedRecipeIds ?? pickedRecipeIds,
      recipeMap: newRecipeMap ?? recipeMap,
      ingredientsAddedByRecipe:
          newIngredientsAddedByRecipe ?? ingredientsAddedByRecipe,
      instructionsDoneByRecipe:
          newInstructionsDoneByRecipe ?? instructionsDoneByRecipe,
    );
  }

  String? getTitleForRecipe(int recipeId) {
    final recipe = recipeMap[recipeId];
    return recipe?.title;
  }

  // // FIXME: Can equatable figure out custom classes like Recipe?
  // @override
  // List<Object?> get props => [
  //       cookingRecipes,
  //     ];
}
