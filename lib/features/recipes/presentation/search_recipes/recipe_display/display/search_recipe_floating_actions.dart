import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/features/recipes/application/viewing_config_provider.dart';
import 'package:mobile/widgets/animated_floating_actions/action_config.dart';
import 'package:mobile/widgets/animated_floating_actions/animated_floating_actions.dart';

const floatingActionsMargin = 15.0;
const modeLabel = 'mode';
const picksLabel = 'picks';
const columnsLabel = 'columns';

class SearchRecipesFloatingActions extends ConsumerWidget {
  const SearchRecipesFloatingActions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Positioned(
      right: floatingActionsMargin,
      bottom: floatingActionsMargin,
      child: AnimatedFloatingActions(
        actionConfigs: [
          ActionConfig(
            label: modeLabel,
            iconData: Icons.grid_view,
            onPressed: _toggleDisplayMode(ref),
          ),
          ActionConfig(
            label: picksLabel,
            iconData: Icons.library_add_check,
            onPressed: _toggleShowPickedRecipes(ref),
          ),
          ActionConfig(
            label: columnsLabel,
            iconData: Icons.view_week,
            onPressed: _toggleColumnsCount(ref),
          ),
        ],
      ),
    );
  }

  ToggleConfigurationFn _toggleShowPickedRecipes(WidgetRef ref) {
    return () =>
        ref.read(viewingConfigProvider.notifier).toggleShowPickedRecipes();
  }

  ToggleConfigurationFn _toggleDisplayMode(WidgetRef ref) {
    return () =>
        ref.read(viewingConfigProvider.notifier).toggleRecipeDisplayMode();
  }

  ToggleConfigurationFn _toggleColumnsCount(WidgetRef ref) {
    return () =>
        ref.read(viewingConfigProvider.notifier).toggleColumnsShownCount();
  }
}

typedef ToggleConfigurationFn = void Function();
