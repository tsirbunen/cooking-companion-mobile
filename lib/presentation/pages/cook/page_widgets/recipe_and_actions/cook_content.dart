import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/presentation/pages/cook/page_widgets/ingredients_and_instructions/groups.dart';
import 'package:mobile/presentation/pages/cook/page_widgets/ingredients_and_instructions/ingredient_group.dart';
import 'package:mobile/presentation/pages/cook/page_widgets/ingredients_and_instructions/instruction_group.dart';
import 'package:mobile/presentation/pages/cook/page_widgets/title_photo_and_tag_widgets/photos.dart';
import 'package:mobile/presentation/pages/cook/page_widgets/title_photo_and_tag_widgets/title_and_tags.dart';
import 'package:mobile/business_logic/cook_logic/cook_bloc.dart';
import 'package:mobile/business_logic/cook_logic/cook_state.dart';

double topTransparentContainerHeight = photoHeight - titleContainerBorderRadius;
const double bottomSpacing = 80;
const String ingredientsTitle = 'INGREDIENTS';
const String instructionsTitle = 'INSTRUCTIONS';
const String noRecipeText = 'No recipe';

class CookContent extends StatelessWidget {
  final int recipeId;
  const CookContent({super.key, required this.recipeId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CookBloc, CookState>(builder: (
      BuildContext context,
      CookState state,
    ) {
      final recipe = state.recipeMap[recipeId];
      if (recipe == null) return const Text(noRecipeText);

      return LayoutBuilder(
        builder: (
          BuildContext context,
          BoxConstraints constraints,
        ) {
          final width = constraints.maxWidth;

          return Column(
            children: [
              Container(
                color: Colors.transparent,
                height: topTransparentContainerHeight,
              ),
              TitleAndTags(
                tags: recipe.tags ?? [],
                title: recipe.title,
                width: width,
              ),
              Groups(
                title: ingredientsTitle,
                groups: recipe.ingredientGroups
                    .map((group) => IngredientGroup(
                          group: group,
                          recipeId: recipeId,
                        ))
                    .toList() as List<Widget>,
              ),
              Groups(
                title: instructionsTitle,
                groups: recipe.instructionGroups
                    .map((group) => InstructionGroup(
                          group: group,
                          recipeId: recipeId,
                        ))
                    .toList() as List<Widget>,
              ),
              Container(height: bottomSpacing),
            ],
          );
        },
      );
    });
  }
}
