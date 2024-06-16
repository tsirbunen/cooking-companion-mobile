import 'package:flutter/material.dart';
import 'package:mobile/features/recipes/domain/models/recipe/recipe.dart';
import 'package:mobile/features/recipes/presentation/search_recipes/recipe_display/recipe_as_card/constants.dart';
import 'package:mobile/features/recipes/presentation/search_recipes/recipe_display/recipe_as_card/image_in_card.dart';
import 'package:mobile/features/recipes/presentation/search_recipes/recipe_display/recipe_as_card/title_in_card.dart';
import 'package:mobile/widgets/ink_well_overlay_stack/ink_well_overlay_stack.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  final bool isSelected;
  final void Function() togglePickRecipe;

  const RecipeCard({
    super.key,
    required this.recipe,
    required this.togglePickRecipe,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (
      BuildContext context,
      BoxConstraints constraints,
    ) {
      final dimensions = _getCardDimensions(constraints);

      return Card(
        clipBehavior: Clip.hardEdge,
        elevation: 5.0,
        child: InkWellOverlayStack(
          onTap: togglePickRecipe,
          width: dimensions.width,
          height: dimensions.height,
          child: Container(
            decoration: _getCardDecoration(context, isSelected),
            width: dimensions.width,
            height: dimensions.height,
            child: Column(
              children: [
                ImageInCard(
                  photo: recipe.photos?[0],
                  size: Size(dimensions.width, dimensions.imageHeight),
                ),
                TitleInCard(
                  title: recipe.title,
                  isLarge: dimensions.isVeryLarge,
                  isSelected: isSelected,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  BoxDecoration _getCardDecoration(BuildContext context, bool isSelected) {
    final colors = Theme.of(context).colorScheme;
    final backgroundColor =
        isSelected ? colors.secondaryContainer : Colors.transparent;

    return BoxDecoration(
      color: backgroundColor,
    );
  }

  _CardDimensions _getCardDimensions(BoxConstraints constraints) {
    final width = constraints.maxWidth;
    final height = constraints.maxHeight;
    final isVeryLarge = width > showSingleCardInRowLimit;
    final ratio = isVeryLarge ? imageRatioSingleCardInRow : imageRatio;
    final imageHeight = width / ratio;

    return (
      width: width,
      height: height,
      imageHeight: imageHeight,
      isVeryLarge: isVeryLarge,
    );
  }
}

typedef _CardDimensions = ({
  double width,
  double height,
  double imageHeight,
  bool isVeryLarge,
});
