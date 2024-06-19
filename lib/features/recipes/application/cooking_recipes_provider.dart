import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/features/recipes/domain/models/recipe/recipe.dart';

class CookingRecipe {
  final int recipeId;
  final Recipe recipe;
  const CookingRecipe(this.recipeId, this.recipe);
}

NotifierProvider<CookingSingleRecipeController, CookingRecipe?>
    _createCookingRecipeProvider() {
  return NotifierProvider<CookingSingleRecipeController, CookingRecipe?>(
      CookingSingleRecipeController.new);
}

class CookingSingleRecipeController extends Notifier<CookingRecipe?> {
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
}

final cookingRecipeProviders = [
  _createCookingRecipeProvider(),
  _createCookingRecipeProvider(),
  _createCookingRecipeProvider(),
];

final cookingRecipesProvider =
    Provider<CookingRecipesController>((ProviderRef ref) {
  return CookingRecipesController(ref);
});

class CookingRecipesController {
  final ProviderRef ref;
  CookingRecipesController(this.ref);
  List<NotifierProvider<CookingSingleRecipeController, CookingRecipe?>>
      providers = cookingRecipeProviders;

  void setRecipe(Recipe recipe) {
    for (final provider in providers) {
      final controller = ref.read(provider.notifier);
      if (controller.hasRecipe()) continue;
      controller.setRecipe(recipe);
    }
  }
}
