import 'package:mobile/app_services/router/route_enum.dart';
import 'package:mobile/app_services/router/routes.dart';

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
      case RouteEnum.wizard:
        return WizardRoute.path;
      case RouteEnum.shopping:
        return ShoppingRoute.path;
      case RouteEnum.account:
        return AccountRoute.path;
      default:
        throw Exception('Route path not implemented!');
    }
  }
}
