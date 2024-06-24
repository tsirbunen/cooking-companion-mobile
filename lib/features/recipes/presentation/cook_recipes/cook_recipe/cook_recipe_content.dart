import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/features/recipes/application/cooking_recipe_provider/cooking_single_recipe_provider.dart';

class CookRecipeContent extends ConsumerWidget {
  final CookingProvider provider;
  const CookRecipeContent({super.key, required this.provider});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipeData = ref.watch(provider);
    final id = recipeData?.recipe.id;
    final title = recipeData?.recipe.title ?? 'No recipe found';

    return Container(
      child: Column(
        children: [
          Text(id != null ? id.toString() : 'No id found'),
          Text(title),
        ],
      ),
    );
  }
}
