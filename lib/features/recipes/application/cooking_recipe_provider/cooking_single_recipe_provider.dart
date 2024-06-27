import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/features/recipes/application/cooking_recipe_provider/position_enum.dart';
import 'package:mobile/features/recipes/domain/models/recipe/recipe.dart';

typedef CookingProvider
    = NotifierProvider<CookingSingleRecipeController, CookingRecipe?>;

class CookingRecipe {
  final int recipeId;
  final Recipe recipe;
  bool isCooking;
  List<int> ingredientsAdded;
  List<int> instructionsDone;

  CookingRecipe(
    this.recipeId,
    this.recipe,
    this.isCooking,
    this.ingredientsAdded,
    this.instructionsDone,
  );

  CookingRecipe copy() {
    return CookingRecipe(
      recipeId,
      recipe,
      isCooking,
      [...ingredientsAdded],
      [...instructionsDone],
    );
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
    state = CookingRecipe(recipe.id, recipe, false, [], []);
  }

  void setFromHistory(CookingRecipe data) {
    state = data;
  }

  CookingRecipe? getRecipe() {
    return state;
  }

  void clearRecipe() {
    state = null;
  }

  toggleIsCooking() {
    if (state == null) return;

    state!.isCooking = !state!.isCooking;
    state = state!.copy();
  }

  bool isCooking() {
    return state?.isCooking ?? false;
  }

  toggleIngredient(int id) {
    if (state == null) return;

    if (state!.ingredientsAdded.contains(id)) {
      state!.ingredientsAdded.remove(id);
    } else {
      state!.ingredientsAdded.add(id);
    }

    state = state!.copy();
  }

  getIngredientsAdded() {
    return state?.ingredientsAdded ?? [];
  }

  toggleInstruction(int id) {
    if (state == null) return;

    if (state!.instructionsDone.contains(id)) {
      state!.instructionsDone.remove(id);
    } else {
      state!.instructionsDone.add(id);
    }

    state = state!.copy();
  }

  getInstructionsDone() {
    return state?.instructionsDone ?? [];
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
