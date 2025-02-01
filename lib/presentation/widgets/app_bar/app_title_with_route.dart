import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/app_services/blocs/blocs.dart';
import 'package:mobile/app_services/logger/logger.dart';
import 'package:mobile/app_services/router/routes.dart';
import 'package:mobile/business_logic/cook_logic/cook_bloc.dart';
import 'package:mobile/business_logic/search_logic/search_bloc.dart';
import 'package:mobile/business_logic/search_logic/search_state.dart';

const String appTitle = 'Cooking companion';
const String defaultRoute = 'HOME';
const double textHeight = 1.15;
const double routeFontSize = 22.0;
const String recipeInCookingRouteLabel = 'RECIPE IN COOKING';
const String cookRecipeLabel = 'COOK RECIPE';

class AppTitleWithRoute extends StatelessWidget {
  const AppTitleWithRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(builder: (
      BuildContext context,
      SearchState state,
    ) {
      final baseStyle = Theme.of(context).textTheme.titleMedium;
      final colors = Theme.of(context).colorScheme;
      final pickedRecipeIds = state.pickedRecipeIds;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            appTitle,
            style: _getTitleStyle(baseStyle!, colors),
          ),
          Text(
            _getCurrentRouteInfo(context, pickedRecipeIds),
            style: _getRouteStyle(baseStyle, colors),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      );
    });
  }

  String _getCurrentRouteInfo(BuildContext context, List<int> pickedRecipeIds) {
    final recipeTitle = _getRecipeTitleIfCooking(context, pickedRecipeIds);
    return recipeTitle ?? _getRootRouteFromSettings(context);
  }

  String? _getRecipeTitleIfCooking(
    BuildContext context,
    List<int> pickedRecipeIds,
  ) {
    try {
      final routerState = GoRouterState.of(context);
      if (routerState.path != CookRecipeRoute.path) return null;

      final String? idString = routerState.pathParameters['id'];
      if (idString == null) return null;
      final recipeId = int.parse(idString);
      final indexOfRecipe = pickedRecipeIds.indexOf(recipeId);
      final recipeOfRecipesInfo =
          '${indexOfRecipe + 1}/${pickedRecipeIds.length}';

      final recipeTitle = getIt<CookBloc>().state.getTitleForRecipe(recipeId);

      return recipeTitle != null
          ? '$recipeOfRecipesInfo: $recipeTitle'
          : '$cookRecipeLabel $recipeOfRecipesInfo';
    } catch (e) {
      logger.error('Error with go router state: $e', runtimeType);
    }

    return null;
  }

  String _getRootRouteFromSettings(BuildContext context) {
    final routeSettings = ModalRoute.of(context)?.settings;
    final routeRaw = routeSettings?.name;
    if (routeRaw == null || routeRaw.isEmpty || routeRaw == '/') {
      return defaultRoute;
    }

    final routeParts = routeRaw.split('/');
    String route = routeParts[1].replaceAll('-', ' ').toUpperCase();
    return route;
  }

  TextStyle _getTitleStyle(TextStyle baseStyle, ColorScheme colors) {
    return baseStyle.copyWith(
      color: colors.tertiaryContainer,
      height: textHeight,
    );
  }

  TextStyle _getRouteStyle(TextStyle baseStyle, ColorScheme colors) {
    return baseStyle.copyWith(
      color: colors.tertiaryFixedDim,
      height: textHeight,
      fontWeight: FontWeight.w700,
      fontSize: routeFontSize,
    );
  }
}
