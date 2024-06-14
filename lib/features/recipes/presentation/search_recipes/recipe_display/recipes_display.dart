import 'package:flutter/material.dart';
import 'package:mobile/features/recipes/domain/models/recipe/recipe.dart';
import 'package:mobile/features/recipes/presentation/search_recipes/recipe_display/recipe_as_card/recipe_cards_grid.dart';
import 'package:mobile/features/recipes/presentation/search_recipes/recipe_display/recipe_display_type_enum.dart';
import 'package:mobile/widgets/animated_floating_actions/action_config.dart';
import 'package:mobile/widgets/animated_floating_actions/animated_floating_actions.dart';
import 'package:mobile/widgets/app_bar/app_bar_customized.dart';

const floatingActionsMargin = 15.0;

class RecipesDisplay extends StatelessWidget {
  final RecipeDisplayType displayType = RecipeDisplayType.card;
  final List<Recipe> recipes;

  const RecipesDisplay({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    Widget content;
    if (displayType == RecipeDisplayType.card) {
      content = RecipeCardsGrid(recipes: recipes);
    } else {
      content = const Text('Not implemented yet');
    }

    final size = _getRecipeContainerSize(context);

    return Stack(
      children: [
        SizedBox(
          width: size.width,
          height: size.height,
          child: content,
        ),
        Positioned(
          right: floatingActionsMargin,
          bottom: floatingActionsMargin,
          child: AnimatedFloatingActions(
            actionConfigs: [
              ActionConfig(
                label: 'next type',
                iconData: Icons.grid_view,
                onPressed: _toggleDisplayType,
              ),
              ActionConfig(
                label: 'pick many',
                iconData: Icons.layers,
                onPressed: _togglePickMultiple,
              ),
              // ActionConfig(
              //   label: 'photos',
              //   iconData: Icons.grid_view,
              //   onPressed: _toggleDisplayType,
              // ),
              // ActionConfig(
              //   label: 'pick many',
              //   iconData: Icons.layers,
              //   onPressed: _togglePickMultiple,
              // ),
              // ActionConfig(
              //   label: 'photos',
              //   iconData: Icons.grid_view,
              //   onPressed: _toggleDisplayType,
              // ),
              // ActionConfig(
              //   label: 'pick many',
              //   iconData: Icons.layers,
              //   onPressed: _togglePickMultiple,
              // ),
              // ActionConfig(
              //   label: 'next type',
              //   iconData: Icons.grid_view,
              //   onPressed: _toggleDisplayType,
              // ),
              // ActionConfig(
              //   label: 'pick many',
              //   iconData: Icons.layers,
              //   onPressed: _togglePickMultiple,
              // ),
            ],
          ),
        )
      ],
    );
  }

  Size _getRecipeContainerSize(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Size(size.width, size.height - appBarHeight);
  }

  void _toggleDisplayType() {}

  void _togglePickMultiple() {}
}
