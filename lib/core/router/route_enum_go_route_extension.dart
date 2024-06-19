import 'package:go_router/go_router.dart';
import 'package:mobile/core/router/route_enum.dart';
import 'package:mobile/core/router/routes.dart';

// Note: Let's use switch-case to return the GoRoute for each route,
// so that if we miss a route, the code editor gives us a warning.
extension GoRouteExtension on RouteEnum {
  GoRoute goRoute() {
    switch (this) {
      case RouteEnum.home:
        return GoRoute(
          path: HomeRoute.path,
          builder: (context, state) => HomeRoute().build(context, state),
        );
      case RouteEnum.search:
        return GoRoute(
          path: SearchRoute.path,
          builder: (context, state) => SearchRoute().build(context, state),
        );
      case RouteEnum.cook:
        return GoRoute(
          path: CookRoute.path,
          builder: (context, state) => CookRoute().build(context, state),
        );
      // return GoRoute(
      //   path: CookRoute.path,
      //   builder: (context, state) {
      //     final recipeId = state.pathParameters['id'];
      //     if (recipeId == null) HomeRoute().build(context, state);

      //     final id = int.tryParse(recipeId!);
      //     if (id == null) HomeRoute().build(context, state);

      //     return CookRoute(id: id!).build(context, state);
      //   },
      // );
      case RouteEnum.settings:
        return GoRoute(
          path: SettingsRoute.path,
          builder: (context, state) => SettingsRoute().build(context, state),
        );
      case RouteEnum.wizard:
        return GoRoute(
          path: WizardRoute.path,
          builder: (context, state) => WizardRoute().build(context, state),
        );
      case RouteEnum.shopping:
        return GoRoute(
          path: ShoppingRoute.path,
          builder: (context, state) => ShoppingRoute().build(context, state),
        );
      default:
        throw Exception('GoRoute not implemented!');
    }
  }
}
