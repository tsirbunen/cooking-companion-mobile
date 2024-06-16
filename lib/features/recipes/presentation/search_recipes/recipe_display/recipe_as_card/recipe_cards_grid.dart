import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/features/recipes/application/picked_recipe_ids_provider.dart';
import 'package:mobile/features/recipes/application/viewing_config_provider.dart';
import 'package:mobile/features/recipes/domain/models/recipe/recipe.dart';
import 'package:mobile/features/recipes/presentation/search_recipes/recipe_display/recipe_as_card/constant_values.dart';
import 'package:mobile/features/recipes/presentation/search_recipes/recipe_display/recipe_as_card/recipe_card.dart';

class RecipeCardsGrid extends ConsumerWidget {
  final List<Recipe> recipes;

  const RecipeCardsGrid({super.key, required this.recipes});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewingConfig = ref.watch(viewingConfigProvider);
    final pickedRecipeIds = ref.watch(pickedRecipesProvider);

    final size = MediaQuery.sizeOf(context);
    final crossAxisCount = _getGridCrossAxisCardCount(size, viewingConfig);

    return Padding(
      padding: const EdgeInsets.all(gridPadding),
      child: GridView.builder(
        itemCount: recipes.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: cardWidthPerHeightRatio,
          crossAxisSpacing: gridSpacing,
          mainAxisSpacing: gridSpacing,
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
        ref.read(pickedRecipesProvider.notifier).togglePickRecipe(recipe.id);
  }

  int _getGridCrossAxisCardCount(Size deviceSize, ViewingConfig viewingConfig) {
    if (viewingConfig.showSingleColumn) return 1;

    final count = deviceSize.width ~/ cardBaseWidth;
    return count > 0 ? count : 1;
  }
}