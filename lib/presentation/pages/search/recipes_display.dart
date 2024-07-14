import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/business_logic/all_recipes_logic/all_recipes_bloc.dart';
import 'package:mobile/business_logic/all_recipes_logic/all_recipes_state.dart';
import 'package:mobile/business_logic/wizard_logic/wizard_bloc.dart';
import 'package:mobile/business_logic/wizard_logic/wizard_state.dart';
import 'package:mobile/presentation/pages/search/search_recipe_floating_actions.dart';
import 'package:mobile/presentation/pages/search/recipe_as_card/recipe_cards_grid.dart';
import 'package:mobile/presentation/pages/search/recipe_as_title/recipe_titles_list.dart';
import 'package:mobile/presentation/pages/search/recipe_display_mode_enum.dart';
import 'package:mobile/business_logic/search_logic/search_bloc.dart';
import 'package:mobile/business_logic/search_logic/search_state.dart';
import 'package:mobile/presentation/widgets/app_bar/app_bar_customized.dart';

const floatingActionsMargin = 15.0;

class RecipesDisplay extends StatelessWidget {
  const RecipesDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllRecipesBloc, AllRecipesState>(
      builder: (
        BuildContext context,
        AllRecipesState allRecipesState,
      ) {
        final recipes = allRecipesState.recipes;

        return BlocBuilder<SearchBloc, SearchState>(
            // FIXME: Should one add more of these around the code?
            buildWhen: (previous, current) =>
                previous.displayMode != current.displayMode,
            builder: (
              BuildContext context,
              SearchState searchState,
            ) {
              final displayMode = searchState.displayMode;
              final size = _getRecipesContainerSize(context);

              return Stack(
                children: [
                  SizedBox(
                    width: size.width,
                    height: size.height,
                    child: displayMode == RecipeDisplayMode.card
                        ? RecipeCardsGrid(recipes: recipes)
                        : RecipeTitlesList(recipes: recipes),
                  ),
                  const SearchRecipesFloatingActions()
                ],
              );
            });
      },
    );
  }

  Size _getRecipesContainerSize(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Size(size.width, size.height - appBarHeight);
  }
}

typedef ToggleConfigurationFn = void Function();
