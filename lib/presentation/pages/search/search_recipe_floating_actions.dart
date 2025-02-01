import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/app_services/blocs/blocs.dart';
import 'package:mobile/app_services/router/route_enum/route_enum.dart';
import 'package:mobile/app_services/router/route_enum/route_enum_path_extension.dart';
import 'package:mobile/presentation/pages/search/picked_recipes/picked_recipes.dart';
import 'package:mobile/business_logic/search_logic/search_bloc.dart';
import 'package:mobile/business_logic/search_logic/search_event.dart';
import 'package:mobile/presentation/widgets/animated_floating_actions/action_config.dart';
import 'package:mobile/presentation/widgets/animated_floating_actions/animated_floating_actions.dart';
import 'package:mobile/presentation/widgets/modal_sheet_utils/bottom_modal_sheet.dart';

const floatingActionsMargin = 15.0;
const modeLabel = 'mode';
const picksLabel = 'picks';
const columnsLabel = 'columns';
const startCookingLabel = 'cook';

class SearchRecipesFloatingActions extends StatelessWidget {
  const SearchRecipesFloatingActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: floatingActionsMargin,
      bottom: floatingActionsMargin,
      child: AnimatedFloatingActions(
        actionConfigs: [
          ActionConfig(
            label: modeLabel,
            iconData: Icons.grid_view,
            onPressed: _toggleDisplayMode(),
          ),
          ActionConfig(
            label: picksLabel,
            iconData: Icons.library_add_check,
            onPressed: _toggleShowPickedRecipes(context),
          ),
          ActionConfig(
            label: startCookingLabel,
            iconData: Icons.restaurant_outlined,
            onPressed: _startCookingPickedRecipes(context),
          ),
        ],
      ),
    );
  }

  void Function() _toggleShowPickedRecipes(BuildContext context) {
    return () => showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            final searchBloc = getIt.get<SearchBloc>();
            final recipes = searchBloc.getPickedRecipes();

            return BottomModalSheet(
              title: pickedRecipesTitle,
              body: PickedRecipes(recipes: recipes),
            );
          },
        );
  }

  void Function() _toggleDisplayMode() {
    final searchBloc = getIt.get<SearchBloc>();
    return () => searchBloc.add(ToggleDisplayModeEvent());
  }

  void Function() _startCookingPickedRecipes(BuildContext context) {
    return () => context.go(RouteEnum.cook.path());
  }
}
