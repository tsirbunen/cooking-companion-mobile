import 'package:go_router/go_router.dart';
import 'package:mobile/core/logger/logger.dart';
import 'package:mobile/core/router/route_enum.dart';
import 'package:mobile/core/router/route_enum_go_route_extension.dart';
import 'package:mobile/core/router/routes.dart';
import 'package:talker_flutter/talker_flutter.dart';

List<GoRoute> routes = RouteEnum.values.map((e) => e.goRoute()).toList();

final router = GoRouter(
  routes: [
    ...routes,
    GoRoute(
      path: CookRecipeRoute.path,
      builder: (context, state) {
        final recipeId = state.pathParameters['id'];
        if (recipeId == null) HomeRoute().build(context, state);

        final id = int.tryParse(recipeId!);
        if (id == null) HomeRoute().build(context, state);

        return CookRecipeRoute(id: id!).build(context, state);
      },
    )
  ],
  observers: [TalkerRouteObserver(logger.talker!)],
);
