import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/features/recipes/application/initial_recipes_provider.dart';
import 'package:mobile/features/recipes/presentation/search_recipes/recipe_display/recipes_display.dart';
import 'package:mobile/widgets/page_base/page_base.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final valueAsync = ref.watch(initialRecipesProvider);

    Widget content = valueAsync.when(
      data: (recipes) => RecipesDisplay(recipes: recipes ?? []),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Text('Error: ${valueAsync.error}'),
    );

    return PageBase(
      pageBody: Column(
        children: [
          content,
        ],
      ),
    );
  }
}
