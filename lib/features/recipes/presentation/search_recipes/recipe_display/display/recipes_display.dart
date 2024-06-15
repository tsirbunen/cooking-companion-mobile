import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/features/recipes/application/viewing_config_provider.dart';
import 'package:mobile/features/recipes/domain/models/recipe/recipe.dart';
import 'package:mobile/features/recipes/presentation/search_recipes/recipe_display/display/search_recipe_floating_actions.dart';
import 'package:mobile/features/recipes/presentation/search_recipes/recipe_display/recipe_as_card/recipe_cards_grid.dart';
import 'package:mobile/features/recipes/presentation/search_recipes/recipe_display/recipe_as_title/recipe_titles_list.dart';
import 'package:mobile/features/recipes/presentation/search_recipes/recipe_display/display/recipe_display_mode_enum.dart';
import 'package:mobile/widgets/app_bar/app_bar_customized.dart';

const floatingActionsMargin = 15.0;

class RecipesDisplay extends ConsumerWidget {
  final List<Recipe> recipes;

  const RecipesDisplay({super.key, required this.recipes});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewingConfig = ref.watch(viewingConfigProvider);
    final displayMode = viewingConfig.displayMode;
    final child = displayMode == RecipeDisplayMode.card
        ? RecipeCardsGrid(recipes: recipes)
        : RecipeTitlesList(recipes: recipes);

    final size = _getRecipesContainerSize(context);

    return Stack(
      children: [
        SizedBox(
          width: size.width,
          height: size.height,
          child: child,
        ),
        const SearchRecipesFloatingActions()
      ],
    );
  }

  Size _getRecipesContainerSize(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Size(size.width, size.height - appBarHeight);
  }
}

typedef ToggleConfigurationFn = void Function();
