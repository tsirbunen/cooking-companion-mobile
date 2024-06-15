import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/features/recipes/application/picked_recipe_ids_provider.dart';
import 'package:mobile/features/recipes/application/viewing_config_provider.dart';
import 'package:mobile/features/recipes/domain/models/recipe/recipe.dart';
import 'package:mobile/features/recipes/presentation/search_recipes/recipe_display/recipe_as_card/constant_values.dart';
import 'package:mobile/features/recipes/presentation/search_recipes/recipe_display/recipe_as_card/recipe_card.dart';
import 'package:mobile/features/recipes/presentation/search_recipes/recipe_display/recipe_as_title/recipe_title.dart';

class RecipeTitlesList extends ConsumerWidget {
  final List<Recipe> recipes;

  const RecipeTitlesList({super.key, required this.recipes});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pickedRecipeIds = ref.watch(pickedRecipesProvider);

    return Padding(
      padding: const EdgeInsets.all(gridPadding),
      child: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (BuildContext context, int index) {
          final recipe = recipes[index];

          return RecipeTitle(
            recipe: recipe,
            isSelected: pickedRecipeIds.contains(recipe.id),
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
}
