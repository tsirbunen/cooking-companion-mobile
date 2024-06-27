import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/logger/logger.dart';
import 'package:mobile/core/router/routes.dart';
import 'package:mobile/features/recipes/application/picked_recipes_provider/picked_recipe_ids_provider.dart';

const String appTitle = 'Cooking companion';
const String defaultRoute = 'HOME';
const double textHeight = 1.15;
const double routeFontSize = 22.0;
const String recipeInCookingRouteLabel = 'RECIPE IN COOKING';
const String cookRecipeLabel = 'COOK RECIPE';

class AppTitleWithRoute extends ConsumerWidget {
  const AppTitleWithRoute({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseStyle = Theme.of(context).textTheme.titleMedium;
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          appTitle,
          style: _getTitleStyle(baseStyle!, colors),
        ),
        Text(
          _getCurrentRoute(context, ref),
          style: _getRouteStyle(baseStyle, colors),
        ),
      ],
    );
  }

  String _getCurrentRoute(BuildContext context, WidgetRef ref) {
    final routeSettings = ModalRoute.of(context)?.settings;
    try {
      final routerState = GoRouterState.of(context);

      if (routerState.path == CookSingleRecipeRoute.path) {
        final String? idString = routerState.pathParameters['id'];
        if (idString != null) {
          final recipeId = int.parse(idString);

          final pickedRecipeIds = ref.read(pickedRecipesProvider);
          final indexOfRecipe = pickedRecipeIds.indexOf(recipeId);
          if (indexOfRecipe != -1) {
            return '$cookRecipeLabel ${indexOfRecipe + 1}/${pickedRecipeIds.length}';
          }
        }
      }
    } catch (e) {
      logger.error('Error with go router state: $e', runtimeType);
    }

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
