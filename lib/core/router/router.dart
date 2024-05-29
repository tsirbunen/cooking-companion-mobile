import 'package:go_router/go_router.dart';
import 'package:mobile/core/router/routes.dart';

// Note: The routes available in the app are defined with this enum:
// Where ever needed, the enum is extended to support new functionality
// (like providing GoRoute here or IconData in drawer).
enum RouteEnum {
  home,
  search,
  cook,
  settings,
}

extension PathExtension on RouteEnum {
  String get path => {
        RouteEnum.home: HomeRoute.path,
        RouteEnum.search: SearchRoute.path,
        RouteEnum.cook: CookRoute.path,
        RouteEnum.settings: SettingsRoute.path,
      }[this]!;
}

// FIXME: How to verify that we get error if path is not implemented
// for all the routes in the enum? Here and elsewhere. This switch does not
// seem to complain if a case is missing!
// extension PathExtension on RouteEnum {
//   String path() {
//     switch (this) {
//       case RouteEnum.home:
//         return HomeRoute.path;
//       case RouteEnum.search:
//         return SearchRoute.path;
//       case RouteEnum.cook:
//         return CookRoute.path;
//       case RouteEnum.settings:
//         return SettingsRoute.path;
//       default:
//         throw Exception('Route path not implemented!');
//     }
//   }
// }

extension GoRouteExtension on RouteEnum {
  GoRoute get goRoute => {
        RouteEnum.home: GoRoute(
          path: HomeRoute.path,
          builder: (context, state) => HomeRoute().build(context, state),
        ),
        RouteEnum.search: GoRoute(
          path: SearchRoute.path,
          builder: (context, state) => SearchRoute().build(context, state),
        ),
        RouteEnum.cook: GoRoute(
          path: CookRoute.path,
          builder: (context, state) => CookRoute().build(context, state),
        ),
        RouteEnum.settings: GoRoute(
          path: SettingsRoute.path,
          builder: (context, state) => SettingsRoute().build(context, state),
        ),
      }[this]!;
}

List<GoRoute> routes = RouteEnum.values.map((e) => e.goRoute).toList();

final router = GoRouter(routes: routes);
