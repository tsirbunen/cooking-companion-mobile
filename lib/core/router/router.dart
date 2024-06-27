import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/logger/logger.dart';
import 'package:mobile/core/router/route_enum.dart';
import 'package:mobile/core/router/route_enum_go_route_extension.dart';
import 'package:mobile/core/router/route_enum_path_extension.dart';
import 'package:mobile/core/router/routes.dart';
import 'package:mobile/features/recipes/application/cooking_recipe_provider/cooking_recipes_provider.dart';
import 'package:mobile/features/recipes/presentation/cook_recipes/cook_single_recipe/cook_single_recipe.dart';
import 'package:talker_flutter/talker_flutter.dart';

const String cookRecipePageKeyBase = 'cook-recipe';

class RouterController {
  final ProviderRef ref;
  String routeName = '';
  RouterController(this.ref);

  String? redirect(BuildContext context, GoRouterState state) {
    if (state.matchedLocation == RouteEnum.cook.path()) {
      ref.read(cookingRecipesProvider).prepareProvidersWithPickedRecipes();
      final int? recipeId =
          ref.read(cookingRecipesProvider).getCurrentFocusRecipeId();
      if (recipeId != null) {
        return '/$cookRecipePathRoot/$recipeId';
      }
    }

    return null;
  }

  GoRouter buildRouter() {
    List<GoRoute> routes = RouteEnum.values.map((e) => e.goRoute()).toList();

    return GoRouter(
      routes: [
        ...routes,
        GoRoute(
          path: CookSingleRecipeRoute.path,
          pageBuilder: (context, state) {
            final recipeId = state.pathParameters['id'];
            if (recipeId == null) HomeRoute().build(context, state);

            final id = int.tryParse(recipeId!);
            if (id == null) HomeRoute().build(context, state);

            AxisDirection direction = AxisDirection.right;
            final extra = state.extra;
            if (extra != null && extra is Map) {
              if (extra.containsKey(directionKey)) {
                direction = extra[directionKey] as AxisDirection;
              }
            }

            return CustomTransitionPage<void>(
              key: ValueKey<String>('$cookRecipePageKeyBase-$id'),
              child: CookSingleRecipeRoute(id: id!).build(context, state),
              transitionDuration: const Duration(milliseconds: 1000),
              transitionsBuilder: (
                BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child,
              ) {
                final begin = direction == AxisDirection.left
                    ? const Offset(-1.0, 0.0)
                    : const Offset(1.0, 0.0);

                var tween = Tween(begin: begin, end: Offset.zero).chain(
                  CurveTween(curve: Curves.ease),
                );
                var offsetAnimation = animation.drive(tween);

                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              },
            );
          },
        )
      ],
      observers: [TalkerRouteObserver(logger.talker!)],
      redirect: redirect,
    );
  }
}
