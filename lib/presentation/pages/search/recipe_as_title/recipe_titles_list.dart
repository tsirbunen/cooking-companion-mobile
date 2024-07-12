import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/app_services/blocs/blocs.dart';
import 'package:mobile/business_logic/models/recipe/recipe.dart';
import 'package:mobile/presentation/pages/search/recipe_as_title/recipe_title.dart';
import 'package:mobile/business_logic/cook_logic/cook_bloc.dart';
import 'package:mobile/business_logic/cook_logic/cook_event.dart';
import 'package:mobile/business_logic/search_logic/search_bloc.dart';
import 'package:mobile/business_logic/search_logic/search_event.dart';
import 'package:mobile/business_logic/search_logic/search_state.dart';

const double listPadding = 8.0;

class RecipeTitlesList extends StatelessWidget {
  final List<Recipe> recipes;

  const RecipeTitlesList({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(builder: (
      BuildContext context,
      SearchState state,
    ) {
      final pickedRecipeIds = state.pickedRecipeIds;
      return Padding(
        padding: const EdgeInsets.all(listPadding),
        child: ListView.builder(
          itemCount: recipes.length,
          itemBuilder: (BuildContext context, int index) {
            final recipe = recipes[index];

            return RecipeTitle(
              recipe: recipe,
              isSelected: pickedRecipeIds.contains(recipe.id),
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
}
