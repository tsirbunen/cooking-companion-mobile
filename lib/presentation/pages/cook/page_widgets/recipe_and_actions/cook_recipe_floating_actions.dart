import 'package:flutter/material.dart';
import 'package:mobile/app_services/blocs/blocs.dart';
import 'package:mobile/business_logic/cook_logic/cook_bloc.dart';
import 'package:mobile/business_logic/cook_logic/cook_event.dart';
import 'package:mobile/presentation/widgets/animated_floating_actions/action_config.dart';
import 'package:mobile/presentation/widgets/animated_floating_actions/animated_floating_actions.dart';

const floatingActionsMargin = 15.0;
const cookLabel = 'cook';
const editLabel = 'edit';

class CookRecipeFloatingActions extends StatelessWidget {
  final int recipeId;

  const CookRecipeFloatingActions({super.key, required this.recipeId});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: floatingActionsMargin,
      bottom: floatingActionsMargin,
      child: AnimatedFloatingActions(
        actionConfigs: [
          ActionConfig(
            label: editLabel,
            iconData: Icons.edit_note,
            onPressed: () => {},
          ),
          ActionConfig(
            label: cookLabel,
            iconData: Icons.library_add_check,
            onPressed: _toggleCookRecipe(),
          ),
        ],
      ),
    );
  }

  void Function() _toggleCookRecipe() {
    return () {
      final cookBloc = getIt.get<CookBloc>();
      return cookBloc.add(ToggleCookRecipeEvent(recipeId));
    };
  }
}
