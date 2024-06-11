import 'package:go_router/go_router.dart';
import 'package:mobile/core/logger/logger.dart';
import 'package:mobile/core/router/routes.dart';
import 'package:talker_flutter/talker_flutter.dart';

// Note: The routes available in the app are defined with this enum:
// Where ever needed, the enum is extended to support new functionality
// (like providing GoRoute here or IconData in drawer).
enum RouteEnum {
  home,
  search,
  cook,
  settings,
}

// Note: Let's use switch-case to return the path for each route,
// so that if we miss a route, the code editor gives us a warning.
extension PathExtension on RouteEnum {
  String path() {
    switch (this) {
      case RouteEnum.home:
        return HomeRoute.path;
      case RouteEnum.search:
        return SearchRoute.path;
      case RouteEnum.cook:
        return CookRoute.path;
      case RouteEnum.settings:
        return SettingsRoute.path;
      default:
        throw Exception('Route path not implemented!');
    }
  }
}

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
      case RouteEnum.settings:
        return GoRoute(
          path: SettingsRoute.path,
          builder: (context, state) => SettingsRoute().build(context, state),
        );
      default:
        throw Exception('GoRoute not implemented!');
    }
  }
}

List<GoRoute> routes = RouteEnum.values.map((e) => e.goRoute()).toList();

final router = GoRouter(
  routes: routes,
  observers: [TalkerRouteObserver(logger.talker!)],
);
