import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/app_services/blocs/blocs.dart';
import 'package:mobile/app_services/router/route_enum.dart';
import 'package:mobile/app_services/router/route_enum_path_extension.dart';
import 'package:mobile/business_logic/cook_logic/cook_bloc.dart';
import 'package:mobile/business_logic/cook_logic/cook_event.dart';
import 'package:mobile/business_logic/wizard_logic/wizard_bloc.dart';
import 'package:mobile/business_logic/wizard_logic/wizard_event.dart';
import 'package:mobile/presentation/widgets/animated_floating_actions/action_config.dart';
import 'package:mobile/presentation/widgets/animated_floating_actions/animated_floating_actions.dart';

const floatingActionsMargin = 15.0;
const cookLabel = 'cook';
const editLabel = 'edit';

class CookRecipeFloatingActionButtons extends StatelessWidget {
  final int recipeId;

  const CookRecipeFloatingActionButtons({super.key, required this.recipeId});

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
            onPressed: _editRecipe(context),
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
      cookBloc.add(ToggleCookRecipeEvent(recipeId));
    };
  }

  void Function() _editRecipe(BuildContext context) {
    return () {
      final wizardBloc = getIt.get<WizardBloc>();
      wizardBloc.add(EditRecipeEvent(recipeId: recipeId));
      context.go(RouteEnum.wizard.path());
    };
  }
}
