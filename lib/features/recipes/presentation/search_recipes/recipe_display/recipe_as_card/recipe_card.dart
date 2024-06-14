import 'package:flutter/material.dart';
import 'package:mobile/features/recipes/domain/models/recipe/recipe.dart';
import 'package:mobile/features/recipes/presentation/search_recipes/recipe_display/recipe_as_card/constant_values.dart';
import 'package:mobile/features/recipes/presentation/search_recipes/recipe_display/recipe_as_card/image_in_card.dart';
import 'package:mobile/widgets/ink_well_overlay_stack/ink_well_overlay_stack.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  final bool isSelected;
  const RecipeCard({super.key, required this.recipe, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    final photo = recipe.photos?[0];
    final colors = Theme.of(context).colorScheme;
    final backgroundColor =
        isSelected ? colors.secondaryContainer : Colors.transparent;
    final textColor = isSelected ? colors.onTertiaryFixed : colors.primary;
    final titleStyle = Theme.of(context).textTheme.titleSmall!.copyWith(
          color: textColor,
        );
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: 5.0,
      child: InkWellOverlayStack(
        onTap: _toggleSelectRecipe,
        width: cardWidth,
        height: cardHeight,
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
          ),
          width: cardWidth,
          height: cardHeight,
          child: Column(
            children: [
              ImageInCard(
                photo: photo,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Text(
                  recipe.title,
                  style: titleStyle,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _toggleSelectRecipe() {
    print('Recipe selected');
  }
}
