import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/features/recipes/application/cooking_recipe_provider/cooking_single_recipe_provider.dart';
import 'package:mobile/features/recipes/presentation/cook_recipes/cook_single_recipe/ingredients_and_instructions/groups.dart';
import 'package:mobile/features/recipes/presentation/cook_recipes/cook_single_recipe/ingredients_and_instructions/ingredient_group.dart';
import 'package:mobile/features/recipes/presentation/cook_recipes/cook_single_recipe/ingredients_and_instructions/instruction_group.dart';
import 'package:mobile/features/recipes/presentation/cook_recipes/cook_single_recipe/title_photo_and_tag_widgets/photos.dart';
import 'package:mobile/features/recipes/presentation/cook_recipes/cook_single_recipe/title_photo_and_tag_widgets/title_and_tags.dart';

const double topTransparentContainerHeight =
    photoHeight - titleContainerBorderRadius;
const double bottomSpacing = 80;
const String ingredientsTitle = 'INGREDIENTS';
const String instructionsTitle = 'INSTRUCTIONS';
const String noRecipeText = 'No recipe';

class CookContent extends ConsumerWidget {
  final CookingProvider provider;
  const CookContent({super.key, required this.provider});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipeData = ref.watch(provider);
    if (recipeData == null) return const Text(noRecipeText);

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
              tags: recipeData.recipe.tags ?? [],
              title: recipeData.recipe.title,
              width: width,
            ),
            Groups(
              title: ingredientsTitle,
              groups: recipeData.recipe.ingredientGroups
                  .map((group) => IngredientGroup(
                        group: group,
                        provider: provider,
                      ))
                  .toList() as List<Widget>,
            ),
            Groups(
              title: instructionsTitle,
              groups: recipeData.recipe.instructionGroups
                  .map((group) => InstructionGroup(
                        group: group,
                        provider: provider,
                      ))
                  .toList() as List<Widget>,
            ),
            Container(height: bottomSpacing),
          ],
        );
      },
    );
  }
}
