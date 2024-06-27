import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/features/recipes/application/cooking_recipe_provider/cooking_single_recipe_provider.dart';
import 'package:mobile/widgets/animated_floating_actions/action_config.dart';
import 'package:mobile/widgets/animated_floating_actions/animated_floating_actions.dart';

const floatingActionsMargin = 15.0;
const cookLabel = 'cook';

class CookSingleRecipeFloatingActions extends ConsumerWidget {
  final CookingProvider? cookingProvider;

  const CookSingleRecipeFloatingActions({super.key, this.cookingProvider});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Positioned(
      right: floatingActionsMargin,
      bottom: floatingActionsMargin,
      child: AnimatedFloatingActions(
        actionConfigs: [
          ActionConfig(
            label: cookLabel,
            iconData: Icons.library_add_check,
            onPressed: _toggleCookRecipe(ref),
          ),
        ],
      ),
    );
  }

  void Function() _toggleCookRecipe(WidgetRef ref) {
    if (cookingProvider == null) return () {};

    return () {
      ref.read(cookingProvider!.notifier).toggleIsCooking();
    };
  }
}
