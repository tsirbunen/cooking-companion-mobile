import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/app_services/blocs/blocs.dart';
import 'package:mobile/business_logic/models/recipe/recipe.dart';
import 'package:mobile/presentation/pages/search/recipe_as_card/constants.dart';
import 'package:mobile/presentation/pages/search/recipe_as_card/recipe_card.dart';
import 'package:mobile/business_logic/cook_logic/cook_bloc.dart';
import 'package:mobile/business_logic/cook_logic/cook_event.dart';
import 'package:mobile/business_logic/search_logic/search_bloc.dart';
import 'package:mobile/business_logic/search_logic/search_event.dart';
import 'package:mobile/business_logic/search_logic/search_state.dart';

class RecipeCardsGrid extends StatelessWidget {
  final List<Recipe> recipes;

  const RecipeCardsGrid({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(builder: (
      BuildContext context,
      SearchState state,
    ) {
      final pickedRecipeIds = state.pickedRecipeIds;

      return Padding(
        padding: const EdgeInsets.all(padding),
        child: GridView.builder(
          itemCount: recipes.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: _getGridCrossAxisCount(context),
            childAspectRatio: cardWidthPerHeightRatio,
            crossAxisSpacing: spacing,
            mainAxisSpacing: spacing,
          ),
          itemBuilder: (BuildContext context, int index) {
            final recipe = recipes[index];
            final isSelected = pickedRecipeIds.contains(recipe.id);

            return RecipeCard(
              recipe: recipe,
              isSelected: isSelected,
              togglePickRecipe: _togglePickRecipe(recipe),
            );
          },
        ),
      );
    });
  }

  _togglePickRecipe(Recipe recipe) {
    final searchBloc = getIt.get<SearchBloc>();
    final cookBloc = getIt.get<CookBloc>();
    return () {
      searchBloc.add(TogglePickSearchRecipeEvent(recipe));
      cookBloc.add(TogglePickCookingRecipeEvent(recipe.id));
    };
  }

  int _getGridCrossAxisCount(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    final count = size.width ~/ cardBaseWidth;
    return count > 0 ? count : 1;
  }
}
