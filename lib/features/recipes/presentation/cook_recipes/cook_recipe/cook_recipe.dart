import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/logger/logger.dart';
import 'package:mobile/core/router/routes.dart';
import 'package:mobile/features/recipes/application/cooking_recipe_provider/cooking_single_recipe_provider.dart';
import 'package:mobile/features/recipes/application/cooking_recipe_provider/side_enum.dart';
import 'package:mobile/features/recipes/domain/models/recipe/recipe.dart';
import 'package:mobile/features/recipes/application/cooking_recipe_provider/cooking_recipes_provider.dart';
import 'package:mobile/features/recipes/presentation/cook_recipes/cook_recipe/cook_recipe_content.dart';
import 'package:mobile/widgets/page_base/page_base.dart';

const String directionKey = 'direction';

class CookRecipe extends ConsumerStatefulWidget {
  final int recipeId;
  final String name = 'CookRecipeTESTNAME';

  const CookRecipe({super.key, required this.recipeId});

  @override
  CookRecipeState createState() => CookRecipeState();
}

class CookRecipeState extends ConsumerState<CookRecipe> {
  CookingProvider? cookingProvider;
  bool navigationPerformed = false;
  bool canStartDetectingSwipes = false;
  bool waited = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // logger.debug('addPostFrameCallback ${widget.recipeId}', runtimeType);
      ref.read(cookingRecipesProvider).updateProviders(widget.recipeId);
      final provider =
          ref.read(cookingRecipesProvider).getProvider(widget.recipeId);

      if (mounted) {
        setState(
          () {
            canStartDetectingSwipes = true;
            cookingProvider = provider;
          },
        );
      }
    });
    Future.delayed(const Duration(milliseconds: 900), () {
      if (mounted) {
        setState(() {
          waited = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final recipeId = widget.recipeId;
    final color = recipeId == 1
        ? Colors.pink
        : recipeId == 2
            ? Colors.orange
            : Colors.lime;

    return PageBase(
        hideAppBar: !waited,
        pageBody:
            // Stack(
            //   children: [
            //     Container(
            //                width: MediaQuery.of(context).size.width,
            //       height: 500,
            //       color: Colors.blue,
            //     ),
            Container(
          width: MediaQuery.of(context).size.width,
          height: 500,
          color: color,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onHorizontalDragUpdate: (DragUpdateDetails details) {
              if (navigationPerformed || !canStartDetectingSwipes) {
                return;
              }

              final delta = details.delta.dx;

              final int? nextRecipeIndex = delta < 0
                  ? ref
                      .read(cookingRecipesProvider)
                      .getRecipeIdOnSide(Side.right, recipeId)
                  : ref
                      .read(cookingRecipesProvider)
                      .getRecipeIdOnSide(Side.left, recipeId);

              if (nextRecipeIndex != null) {
                context.go(
                  '/$cookRecipePathRoot/$nextRecipeIndex',
                  extra: delta < 0
                      ? {directionKey: AxisDirection.right}
                      : {directionKey: AxisDirection.left},
                );
              }
              setState(
                () {
                  navigationPerformed = true;
                },
              );
            },
            child: Column(
              children: [
                if (cookingProvider != null)
                  CookRecipeContent(provider: cookingProvider!)
                else
                  const Text('No recipe found'),
              ],
            ),
          ),
          // ),
          // ],
        ));
  }
}
