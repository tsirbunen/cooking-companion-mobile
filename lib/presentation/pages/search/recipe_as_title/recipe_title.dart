import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/business_logic/models/recipe/recipe.dart';
import 'package:mobile/presentation/pages/search/recipe_as_card/title_in_card.dart';
import 'package:mobile/business_logic/search_logic/search_bloc.dart';
import 'package:mobile/business_logic/search_logic/search_state.dart';
import 'package:mobile/presentation/widgets/checkbox_customizable/checkbox_customizable.dart';

class RecipeTitle extends StatelessWidget {
  final Recipe recipe;
  final bool isSelected;
  final void Function() togglePickRecipe;

  const RecipeTitle({
    super.key,
    required this.recipe,
    required this.togglePickRecipe,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
        builder: (BuildContext context, SearchState state) {
      return LayoutBuilder(builder: (
        BuildContext context,
        BoxConstraints constraints,
      ) {
        final pickedRecipeIds = state.pickedRecipeIds;
        final isSelected = pickedRecipeIds.contains(recipe.id);
        final titleStyle = Theme.of(context).textTheme.headlineSmall;

        return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          final width = constraints.maxWidth;

          return SizedBox(
            width: width,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(children: [
                CheckboxCustomizable(
                  isSelected: isSelected,
                  scale: 1.75,
                  toggle: togglePickRecipe,
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: textPadding),
                        child: Text(
                          recipe.title,
                          style: titleStyle,
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                )
              ]),
            ),
          );
        });
      });
    });
  }
}
