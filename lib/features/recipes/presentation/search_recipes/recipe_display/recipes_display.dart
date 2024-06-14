import 'package:flutter/material.dart';
import 'package:mobile/features/recipes/domain/models/recipe/recipe.dart';
import 'package:mobile/features/recipes/presentation/search_recipes/recipe_display/recipe_as_card/recipe_card.dart';

class RecipesDisplay extends StatelessWidget {
  final List<Recipe> recipes;
  const RecipesDisplay({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: recipes
          .map(
            (recipe) => RecipeCard(
              recipe: recipe,
            ),
          )
          .toList(),
    );
  }
}
