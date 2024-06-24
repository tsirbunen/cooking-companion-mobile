import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/features/recipes/application/picked_recipes_provider/picked_recipe_ids_provider.dart';
import 'package:mobile/features/recipes/application/viewing_config_provider/viewing_config_provider.dart';
import 'package:mobile/features/recipes/domain/models/recipe/recipe.dart';
import 'package:mobile/features/recipes/presentation/search_recipes/recipe_display/recipe_as_card/constants.dart';
import 'package:mobile/features/recipes/presentation/search_recipes/recipe_display/recipe_as_card/recipe_card.dart';

class RecipeCardsGrid extends ConsumerWidget {
  final List<Recipe> recipes;

  const RecipeCardsGrid({super.key, required this.recipes});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewingConfig = ref.watch(viewingConfigProvider);
    final pickedRecipeIds = ref.watch(pickedRecipesProvider);

    return Padding(
      padding: const EdgeInsets.all(padding),
      child: GridView.builder(
        itemCount: recipes.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: _getGridCrossAxisCount(context, viewingConfig),
          childAspectRatio: cardWidthPerHeightRatio,
          crossAxisSpacing: spacing,
          mainAxisSpacing: spacing,
        ),
        itemBuilder: (BuildContext context, int index) {
          final recipe = recipes[index];
          final isSelected = pickedRecipeIds.contains(recipe.id);

          return RecipeCard(
            recipe: recipe,
            isSelected: isSelected,
            togglePickRecipe: _togglePickRecipe(ref, recipe),
          );
        },
      ),
    );
  }

  _togglePickRecipe(WidgetRef ref, Recipe recipe) {
    return () =>
        ref.read(pickedRecipesProvider.notifier).togglePickRecipe(recipe);
  }

  int _getGridCrossAxisCount(
      BuildContext context, ViewingConfig viewingConfig) {
    final size = MediaQuery.sizeOf(context);
    if (viewingConfig.showSingleColumn) return 1;

    final count = size.width ~/ cardBaseWidth;
    return count > 0 ? count : 1;
  }
}
