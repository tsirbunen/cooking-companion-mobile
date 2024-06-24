import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/features/recipes/application/picked_recipes_provider/picked_recipe_ids_provider.dart';
import 'package:mobile/features/recipes/domain/models/recipe/recipe.dart';
import 'package:mobile/features/recipes/presentation/search_recipes/recipe_display/recipe_as_title/recipe_title.dart';

const double listPadding = 8.0;
const pickedRecipesTitle = 'Picked recipes';
const noPickedRecipes = 'No picked recipes ';

class PickedRecipes extends ConsumerWidget {
  final List<Recipe> recipes;

  const PickedRecipes({super.key, required this.recipes});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pickedRecipeIds = ref.watch(pickedRecipesProvider);
    if (pickedRecipeIds.isEmpty) return const Text(noPickedRecipes);

    recipes
        .where((recipe) => pickedRecipeIds.contains(recipe.id))
        .map((recipe) => RecipeTitle(
              recipe: recipe,
              isSelected: pickedRecipeIds.contains(recipe.id),
              togglePickRecipe: _togglePickRecipe(ref, recipe),
            ))
        .toList();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...recipes
            .where((recipe) => pickedRecipeIds.contains(recipe.id))
            .map((recipe) => RecipeTitle(
                  recipe: recipe,
                  isSelected: pickedRecipeIds.contains(recipe.id),
                  togglePickRecipe: _togglePickRecipe(ref, recipe),
                )),
      ],
    );
  }

  _togglePickRecipe(WidgetRef ref, Recipe recipe) {
    return () =>
        ref.read(pickedRecipesProvider.notifier).togglePickRecipe(recipe);
  }
}
