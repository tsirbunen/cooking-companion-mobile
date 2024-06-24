import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/features/recipes/application/cooking_recipe_provider/cooking_single_recipe_provider.dart';
import 'package:mobile/features/recipes/application/cooking_recipe_provider/position_enum.dart';
import 'package:mobile/features/recipes/application/cooking_recipe_provider/side_enum.dart';
import 'package:mobile/features/recipes/application/picked_recipes_provider/picked_recipe_ids_provider.dart';
import 'package:mobile/features/recipes/domain/models/recipe/recipe.dart';

final cookingRecipesProvider =
    Provider<CookingRecipesController>((ProviderRef ref) {
  return CookingRecipesController(ref);
});

class CookingRecipesController {
  final ProviderRef ref;
  Map<Position, CookingProvider> providers = cookingProviders;
  Map<int, CookingRecipe> cookingRecipeHistory = {};
  Position currentFocus = Position.middle;

  CookingRecipesController(this.ref);

  CookingProvider? getProvider(int currentRecipeId) {
    for (final provider in providers.values) {
      if (ref.read(provider)?.recipeId == currentRecipeId) {
        return provider;
      }
    }
    return null;
  }

  int? getRecipeIdOnSide(Side side, int currentId) {
    final ids = _getPickedRecipeIds();
    if (ids.length < 2) return null;
    final currentIndex = ids.indexOf(currentId);
    if (currentIndex == -1) return null;

    final nextIndex = side == Side.left
        ? _getIndexOnLeft(ids, currentIndex)
        : _getIndexOnRight(ids, currentIndex);

    return ids[nextIndex];
  }

  int? getCurrentFocusRecipeId() {
    return ref.read(providers[currentFocus]!)?.recipeId;
  }

  // Note: Set recipes to providers so that the first picked recipe or the previous
  // focus recipe is in the middle position and the next two picked recipes are in the
  // right position and the left position.
  prepareProvidersWithPickedRecipes() {
    _copyAllEarlierProviderValuesToHistory();

    final pickedRecipes = _getPickedRecipes();
    if (pickedRecipes.isEmpty) {
      _clearAllProviderRecipes();
      return;
    }

    int? focusRecipeId = getCurrentFocusRecipeId();
    final recipes = _getArrangedRecipes(focusRecipeId, pickedRecipes);
    final providersInOrder = _getArrangedProviders();
    _updateAllProvidersData(providersInOrder, recipes);
  }

  void updateProviders(int newFocusRecipeId) {
    final recipeIds = ref.read(pickedRecipesProvider);
    if (recipeIds.length <= 3) return;

    final focusPosition = _getUpdatedFocusPosition(newFocusRecipeId);
    final focusIndex = recipeIds.indexOf(newFocusRecipeId);
    final recipes = _getPickedRecipes();

    final previousRecipe = _getPreviousRecipe(focusIndex, recipes);
    final previousPosition = focusPosition.getPositionOnSide(Side.left);
    _updateProviderRecipeIfChanged(previousPosition, previousRecipe);

    final nextRecipe = _getNextRecipe(focusIndex, recipes);
    final nextPosition = focusPosition.getPositionOnSide(Side.right);
    _updateProviderRecipeIfChanged(nextPosition, nextRecipe);
  }

  void _updateProviderRecipeIfChanged(Position position, Recipe recipe) {
    final provider = providers[position]!;
    final currentLeftData = ref.read(provider);
    if (currentLeftData?.recipeId != recipe.id) {
      _copyEarlierProviderValueToHistory(provider);
      _setProviderRecipe(provider, recipe);
    }
  }

  Position _getUpdatedFocusPosition(int newFocusRecipeId) {
    for (final provider in providers.values) {
      if (ref.read(provider)?.recipeId == newFocusRecipeId) {
        final focusPosition = ref.read(provider.notifier).position;
        currentFocus = focusPosition;
        return focusPosition;
      }
    }

    currentFocus = Position.middle;
    return currentFocus;
  }

  Recipe _getPreviousRecipe(index, recipes) {
    return recipes[_getIndexOnLeft(recipes, index)];
  }

  Recipe _getNextRecipe(index, recipes) {
    return recipes[_getIndexOnRight(recipes, index)];
  }

  List<Recipe> _getPickedRecipes() {
    return ref.read(pickedRecipesProvider.notifier).recipes;
  }

  List<int> _getPickedRecipeIds() {
    return ref.read(pickedRecipesProvider);
  }

  int _getIndexOnRight<T>(List<T> items, int currentIndex) {
    return currentIndex >= items.length - 1 ? 0 : currentIndex + 1;
  }

  int _getIndexOnLeft<T>(List<T> items, int currentIndex) {
    return currentIndex == 0 ? items.length - 1 : currentIndex - 1;
  }

  void _copyEarlierProviderValueToHistory(CookingProvider provider) {
    final data = ref.read(provider);
    if (data != null) cookingRecipeHistory[data.recipeId] = data;
  }

  void _copyAllEarlierProviderValuesToHistory() {
    for (final provider in providers.values) {
      _copyEarlierProviderValueToHistory(provider);
    }
  }

  void _clearAllProviderRecipes() {
    for (final provider in providers.values) {
      _clearProviderRecipe(provider);
    }
  }

  void _clearProviderRecipe(CookingProvider provider) {
    final controller = ref.read(provider.notifier);
    if (controller.hasRecipe()) {
      controller.clearRecipe();
    }
  }

  void _setProviderRecipe(CookingProvider provider, Recipe recipe) {
    final controller = ref.read(provider.notifier);
    controller.setRecipe(recipe);
  }

  List<Recipe> _getArrangedRecipes(int? focusRecipeId, List<Recipe> recipes) {
    final orderedRecipes = <Recipe>[];
    List<int> recipeIds = recipes.map((e) => e.id).toList();
    final int focusIndex =
        focusRecipeId != null ? recipeIds.indexOf(focusRecipeId) : 0;

    orderedRecipes.addAll(recipes.sublist(focusIndex));
    if (focusIndex > 0) {
      orderedRecipes.addAll(recipes.sublist(0, focusIndex));
    }
    return orderedRecipes;
  }

  List<CookingProvider> _getArrangedProviders() {
    final positionsInOrder = getPositionsStartingFrom(currentFocus);
    final providersInOrder =
        positionsInOrder.map((e) => providers[e]!).toList();
    return providersInOrder;
  }

  _updateAllProvidersData(
    List<CookingProvider> providersInOrder,
    List<Recipe> recipes,
  ) {
    for (int i = 0; i < providersInOrder.length; i++) {
      final provider = providersInOrder[i];
      final recipe = recipes.length > i ? recipes[i] : null;
      recipe != null
          ? _setProviderRecipe(provider, recipe)
          : _clearProviderRecipe(provider);
    }
  }
}
