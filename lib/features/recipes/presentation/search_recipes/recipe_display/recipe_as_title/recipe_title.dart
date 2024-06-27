import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/features/recipes/application/picked_recipes_provider/picked_recipe_ids_provider.dart';
import 'package:mobile/features/recipes/domain/models/recipe/recipe.dart';
import 'package:mobile/features/recipes/presentation/search_recipes/recipe_display/recipe_as_card/title_in_card.dart';
import 'package:mobile/widgets/checkbox_customizable/checkbox_customizable.dart';

class RecipeTitle extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(builder: (
      BuildContext context,
      BoxConstraints constraints,
    ) {
      final pickedRecipeIds = ref.watch(pickedRecipesProvider);
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
  }
}
