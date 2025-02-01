import 'package:mobile/app_services/router/route_enum.dart';

extension DescriptionExtension on RouteEnum {
  String description() {
    switch (this) {
      case RouteEnum.home:
        return 'Welcome to Cooking Companion!';
      case RouteEnum.search:
        return 'Browse the recipe collection and select one or multiple dishes to cook';
      case RouteEnum.cook:
        return 'Manage cooking multiple recipes simultaneously';
      case RouteEnum.settings:
        return 'Customize your app experience and manage your (optional) account';
      case RouteEnum.wizard:
        return 'Craft your own culinary masterpieces with the recipe creation wizard';
      case RouteEnum.shopping:
        return 'Generate a shopping list based on recipe ingredients';
      case RouteEnum.account:
        return 'Sign up or into an account to create and manage your own recipes';
      default:
        throw Exception('Route description not implemented!');
    }
  }
}
