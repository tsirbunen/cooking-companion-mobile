import 'package:flutter/material.dart';
import 'package:mobile/features/recipes/domain/models/recipe/recipe.dart';
import 'package:mobile/features/recipes/presentation/search_recipes/recipe_display/recipe_as_card/constant_values.dart';
import 'package:mobile/features/recipes/presentation/search_recipes/recipe_display/recipe_as_card/recipe_card.dart';

const double gridPadding = 8.0;
const double gridSpacing = 5.0;

class RecipeCardsGrid extends StatefulWidget {
  final List<Recipe> recipes;

  const RecipeCardsGrid({super.key, required this.recipes});

  @override
  State<RecipeCardsGrid> createState() => _RecipeCardsGridState();
}

class _RecipeCardsGridState extends State<RecipeCardsGrid> {
  bool _showSingleCardPerRow = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final crossAxisCount = _getGridCrossAxisCardCount(size);

    return Padding(
      padding: const EdgeInsets.all(gridPadding),
      child: GridView.builder(
        itemCount: widget.recipes.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: cardWidthPerHeightRatio,
          crossAxisSpacing: gridSpacing,
          mainAxisSpacing: gridSpacing,
        ),
        itemBuilder: (BuildContext context, int index) {
          final recipe = widget.recipes[index];

          return RecipeCard(
            recipe: recipe,
          );
        },
      ),
    );
  }

  int _getGridCrossAxisCardCount(Size deviceSize) {
    if (_showSingleCardPerRow) return 1;

    final count = deviceSize.width ~/ cardBaseWidth;
    return count > 0 ? count : 1;
  }
}
