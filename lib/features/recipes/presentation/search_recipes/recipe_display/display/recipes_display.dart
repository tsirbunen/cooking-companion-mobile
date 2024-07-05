import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/features/recipes/application/viewing_config_provider/viewing_config_provider.dart';
import 'package:mobile/features/recipes/domain/models/recipe/recipe.dart';
import 'package:mobile/features/recipes/presentation/search_recipes/recipe_display/display/search_recipe_floating_actions.dart';
import 'package:mobile/features/recipes/presentation/search_recipes/recipe_display/picked_recipes/picked_recipes.dart';
import 'package:mobile/features/recipes/presentation/search_recipes/recipe_display/recipe_as_card/recipe_cards_grid.dart';
import 'package:mobile/features/recipes/presentation/search_recipes/recipe_display/recipe_as_title/recipe_titles_list.dart';
import 'package:mobile/features/recipes/presentation/search_recipes/recipe_display/display/recipe_display_mode_enum.dart';
import 'package:mobile/widgets/app_bar/app_bar_customized.dart';
import 'package:mobile/widgets/modal_sheets/bottom_modal_sheet.dart';

const floatingActionsMargin = 15.0;

class RecipesDisplay extends ConsumerStatefulWidget {
  final List<Recipe> recipes;

  const RecipesDisplay({super.key, required this.recipes});

  @override
  RecipesDisplayState createState() => RecipesDisplayState();
}

class RecipesDisplayState extends ConsumerState<RecipesDisplay> {
  @override
  void initState() {
    super.initState();

    ref.listenManual(viewingConfigProvider, (previous, next) {
      // Note: The viewingConfig state might change for other fields as well,
      // we are only interested in the showPickedRecipes field.
      final showPickedPrevious = previous?.showPickedRecipes;
      final showPickedNext = next.showPickedRecipes;
      if (showPickedNext && showPickedNext != showPickedPrevious) {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) => BottomModalSheet(
            title: pickedRecipesTitle,
            body: PickedRecipes(recipes: widget.recipes),
          ),
        ).whenComplete(() {
          ref.read(viewingConfigProvider.notifier).toggleShowPickedRecipes();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewingConfig = ref.watch(viewingConfigProvider);
    final displayMode = viewingConfig.displayMode;

    final recipesWidget = displayMode == RecipeDisplayMode.card
        ? RecipeCardsGrid(recipes: widget.recipes)
        : RecipeTitlesList(recipes: widget.recipes);

    final size = _getRecipesContainerSize(context);

    return Stack(
      children: [
        SizedBox(
          width: size.width,
          height: size.height,
          child: recipesWidget,
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
