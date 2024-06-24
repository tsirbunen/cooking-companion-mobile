import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/features/recipes/domain/models/recipe/recipe.dart';

final pickedRecipesProvider =
    NotifierProvider<PickedRecipesController, List<int>>(
        PickedRecipesController.new);

class PickedRecipesController extends Notifier<List<int>> {
  List<Recipe> recipes = [];

  @override
  List<int> build() {
    return [];
  }

  void togglePickRecipe(Recipe recipe) {
    if (state.contains(recipe.id)) {
      // Note: We have to specifically set the "state" to a new value
      // with "state = ..." because that is the event that triggers
      // the UI rebuilds!
      recipes = recipes.where((r) => r.id != recipe.id).toList();
      state = state.where((id) => id != recipe.id).toList();
    } else {
      state = [...state, recipe.id];
      recipes = [...recipes, recipe];
    }
  }
}
