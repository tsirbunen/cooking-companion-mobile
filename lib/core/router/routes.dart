import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/features/recipes/presentation/cook_recipes/cook_page.dart';
import 'package:mobile/features/users/presentation/home_page.dart';
import 'package:mobile/features/recipes/presentation/search_recipes/page/search_page.dart';
import 'package:mobile/features/users/presentation/settings_page.dart';
import 'package:mobile/features/users/presentation/shopping_page.dart';
import 'package:mobile/features/users/presentation/wizard_page.dart';

// Note: We want to use type-safe routes, and for that, go_router supports using routes
// generated with the go_router_builder package (that uses build_runner under the hood).
// Using "part" to import code is generally discouraged by the Dart team, but widely used
// in the Flutter community in cases of code generation and here we also resort to that
// to import the generated code parts.
part 'routes.g.dart';

@TypedGoRoute<HomeRoute>(path: HomeRoute.path, routes: [
  TypedGoRoute<HomeRoute>(path: HomeRoute.path),
  TypedGoRoute<SearchRoute>(path: SearchRoute.path),
  TypedGoRoute<CookRoute>(path: CookRoute.path),
  TypedGoRoute<SettingsRoute>(path: SettingsRoute.path),
  TypedGoRoute<ShoppingRoute>(path: ShoppingRoute.path),
  TypedGoRoute<WizardRoute>(path: WizardRoute.path),
]) // NOTE: No space here, otherwise the go router builder code generation won't work!
@immutable
class HomeRoute extends GoRouteData {
  static const path = '/';

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomePage();
}

@immutable
class SearchRoute extends GoRouteData {
  static const path = '/search';
  @override
  Widget build(BuildContext context, GoRouterState state) => const SearchPage();
}

@immutable
class CookRoute extends GoRouteData {
  static const path = '/cook';
  @override
  Widget build(BuildContext context, GoRouterState state) => const CookPage();
}

@immutable
class SettingsRoute extends GoRouteData {
  static const path = '/settings';
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SettingsPage();
}

@immutable
class ShoppingRoute extends GoRouteData {
  static const path = '/shopping';
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ShoppingPage();
}

@immutable
class WizardRoute extends GoRouteData {
  static const path = '/wizard';
  @override
  Widget build(BuildContext context, GoRouterState state) => const WizardPage();
}
