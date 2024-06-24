import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/features/recipes/application/cooking_recipe_provider/position_enum.dart';
import 'package:mobile/features/recipes/domain/models/recipe/recipe.dart';

typedef CookingProvider
    = NotifierProvider<CookingSingleRecipeController, CookingRecipe?>;

class CookingRecipe {
  final int recipeId;
  final Recipe recipe;
  const CookingRecipe(this.recipeId, this.recipe);

  int getRecipeId() {
    return recipeId;
  }
}

CookingProvider _createCookingRecipeProvider(Position position) {
  return CookingProvider(() => CookingSingleRecipeController(position));
}

class CookingSingleRecipeController extends Notifier<CookingRecipe?> {
  final Position position;
  CookingSingleRecipeController(this.position) : super();

  @override
  CookingRecipe? build() {
    return null;
  }

  bool hasRecipe() {
    return state != null;
  }

  void setRecipe(Recipe recipe) {
    state = CookingRecipe(recipe.id, recipe);
  }

  CookingRecipe? getRecipe() {
    return state;
  }

  void clearRecipe() {
    state = null;
  }
}

final cookingProviderLeft = _createCookingRecipeProvider(Position.left);
final cookingProviderMiddle = _createCookingRecipeProvider(Position.middle);
final cookingProviderRight = _createCookingRecipeProvider(Position.right);

Map<Position, CookingProvider> cookingProviders = {
  Position.left: cookingProviderLeft,
  Position.middle: cookingProviderMiddle,
  Position.right: cookingProviderRight,
};
