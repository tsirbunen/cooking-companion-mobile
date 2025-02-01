import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/app_services/logger/logger.dart';
import 'package:mobile/app_services/blocs/blocs.dart';
import 'package:mobile/app_services/router/route_enum/route_enum.dart';
import 'package:mobile/app_services/router/route_enum/route_enum_go_route_extension.dart';
import 'package:mobile/app_services/router/route_enum/route_enum_path_extension.dart';
import 'package:mobile/app_services/router/routes.dart';
import 'package:mobile/business_logic/search_logic/search_bloc.dart';
import 'package:mobile/business_logic/wizard_logic/wizard_bloc.dart';
import 'package:mobile/business_logic/wizard_logic/wizard_event.dart';
import 'package:mobile/presentation/pages/cook/page/cook_recipe_page.dart';
import 'package:mobile/business_logic/cook_logic/cook_bloc.dart';
import 'package:talker_flutter/talker_flutter.dart';

const String cookRecipePageKeyBase = 'cook-recipe';

class RouterController {
  String routeName = '';
  RouterController();

  String? redirect(BuildContext context, GoRouterState state) {
    if (state.matchedLocation == RouteEnum.cook.path()) {
      final cookBloc = getIt.get<CookBloc>();
      final int? recipeId = cookBloc.getFocusRecipeId();
      if (recipeId != null) {
        return '/$cookRecipePathRoot/$recipeId';
      }
    }

    if (state.matchedLocation == RouteEnum.wizard.path()) {
      final searchBloc = getIt.get<SearchBloc>();
      final pickedRecipes = searchBloc.getPickedRecipes();
      if (pickedRecipes.length == 1) {
        final wizardBloc = getIt.get<WizardBloc>();
        wizardBloc.add(EditRecipeEvent(recipeId: pickedRecipes[0].id));
        return RouteEnum.wizard.path();
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
          path: CookRecipeRoute.path,
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
              child: CookRecipeRoute(id: id!).build(context, state),
              transitionDuration: const Duration(milliseconds: 1700),
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
                  CurveTween(curve: Curves.easeInOutQuad),
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
