import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/router/routes.dart';
import 'package:mobile/features/recipes/application/cooking_recipe_provider/cooking_single_recipe_provider.dart';
import 'package:mobile/features/recipes/application/cooking_recipe_provider/side_enum.dart';
import 'package:mobile/features/recipes/application/cooking_recipe_provider/cooking_recipes_provider.dart';
import 'package:mobile/features/recipes/presentation/cook_recipes/cook_single_recipe/cook_content.dart';
import 'package:mobile/features/recipes/presentation/cook_recipes/cook_single_recipe/cook_single_recipe_floating_actions.dart';
import 'package:mobile/features/recipes/presentation/cook_recipes/cook_single_recipe/title_photo_and_tag_widgets/photos.dart';
import 'package:mobile/widgets/page_base/page_base_customizable.dart';

const String directionKey = 'direction';

class CookSingleRecipe extends ConsumerStatefulWidget {
  final int recipeId;

  const CookSingleRecipe({super.key, required this.recipeId});

  @override
  CookSingleRecipeState createState() => CookSingleRecipeState();
}

class CookSingleRecipeState extends ConsumerState<CookSingleRecipe> {
  CookingProvider? _cookingProvider;
  bool _shouldDetectSwipes = false;
  bool _animationsDone = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(cookingRecipesProvider).updateProviders(widget.recipeId);
      final provider =
          ref.read(cookingRecipesProvider).getProvider(widget.recipeId);

      if (mounted) {
        setState(() => _cookingProvider = provider);
      }
    });

    Future.delayed(const Duration(milliseconds: 900), () {
      if (mounted) {
        setState(() {
          _animationsDone = true;
          _shouldDetectSwipes = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageBaseCustomizable(
      hideAppBar: !_animationsDone,
      backgroundWidget: RecipePhotos(cookingProvider: _cookingProvider),
      pageBody: Container(
        color: Colors.transparent,
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onHorizontalDragUpdate: _navigateToAnotherRecipeOnSwipe,
          child: Column(
            children: [
              if (_cookingProvider != null)
                CookContent(provider: _cookingProvider!)
              else
                const Text('No recipe found'),
            ],
          ),
        ),
      ),
      floatingWidget: _animationsDone
          ? CookSingleRecipeFloatingActions(cookingProvider: _cookingProvider)
          : null,
    );
  }

  void _navigateToAnotherRecipeOnSwipe(DragUpdateDetails details) {
    if (!_shouldDetectSwipes) return;

    final Side side = _getSideFromSwipe(details);
    final int? recipeOnSideId = _getIdOfRecipeOnSide(side);
    if (recipeOnSideId == null) return;

    _navigateToRecipeWithPageSlideFromSide(recipeOnSideId, side);
    setState(() => _shouldDetectSwipes = false);
  }

  Side _getSideFromSwipe(DragUpdateDetails details) {
    return details.delta.dx < 0 ? Side.right : Side.left;
  }

  int? _getIdOfRecipeOnSide(Side side) {
    return ref
        .read(cookingRecipesProvider)
        .getRecipeIdOnSide(side, widget.recipeId);
  }

  void _navigateToRecipeWithPageSlideFromSide(int id, Side side) {
    context.go(
      _getCookRecipeWithIdRoute(id),
      extra: {directionKey: _getPageTransitionFromDirection(side)},
    );
  }

  String _getCookRecipeWithIdRoute(int id) {
    return '/$cookRecipePathRoot/$id';
  }

  AxisDirection _getPageTransitionFromDirection(Side side) {
    return side == Side.right ? AxisDirection.right : AxisDirection.left;
  }
}
