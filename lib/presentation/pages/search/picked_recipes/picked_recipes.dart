import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/app_services/blocs/blocs.dart';
import 'package:mobile/business_logic/cook_logic/cook_bloc.dart';
import 'package:mobile/business_logic/cook_logic/cook_event.dart';
import 'package:mobile/business_logic/models/recipe/recipe.dart';
import 'package:mobile/presentation/pages/search/recipe_as_title/recipe_title.dart';
import 'package:mobile/business_logic/search_logic/search_bloc.dart';
import 'package:mobile/business_logic/search_logic/search_event.dart';
import 'package:mobile/business_logic/search_logic/search_state.dart';

const double listPadding = 8.0;
const pickedRecipesTitle = 'Picked recipes';
const noPickedRecipes = 'No picked recipes ';

class PickedRecipes extends StatelessWidget {
  final List<Recipe> recipes;

  const PickedRecipes({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(builder: (
      BuildContext context,
      SearchState state,
    ) {
      final pickedRecipeIds = state.pickedRecipeIds;
      if (pickedRecipeIds.isEmpty) return const Text(noPickedRecipes);

      recipes
          .where((recipe) => pickedRecipeIds.contains(recipe.id))
          .map((recipe) => RecipeTitle(
                recipe: recipe,
                isSelected: pickedRecipeIds.contains(recipe.id),
                togglePickRecipe: _togglePickRecipe(recipe),
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
                    togglePickRecipe: _togglePickRecipe(recipe),
                  )),
        ],
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
}
