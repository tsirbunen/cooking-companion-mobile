import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/presentation/pages/cook/page/cook_recipe_page.dart';
import 'package:mobile/presentation/pages/cook/page/cook_page_no_recipes.dart';
import 'package:mobile/presentation/pages/wizard/page/wizard_page.dart';
import 'package:mobile/presentation/pages/home/home_page.dart';
import 'package:mobile/presentation/pages/search/page/search_page.dart';
import 'package:mobile/presentation/pages/settings/settings_page.dart';
import 'package:mobile/presentation/pages/shopping/shopping_page.dart';

// Note: We want to use type-safe routes, and for that, go_router supports using routes
// generated with the go_router_builder package (that uses build_runner under the hood).
// Using "part" to import code is generally discouraged by the Dart team, but widely used
// in the Flutter community in cases of code generation and here we also resort to that
// to import the generated code parts.
part 'routes.g.dart';

const cookRecipePathRoot = 'cook-recipe';
const searchPath = '/search';
const cookPath = '/cook';
const settingsPath = '/settings';
const shoppingPath = '/shopping';
const wizardPath = '/wizard';

@TypedGoRoute<HomeRoute>(path: HomeRoute.path, routes: [
  TypedGoRoute<HomeRoute>(path: HomeRoute.path),
  TypedGoRoute<SearchRoute>(path: SearchRoute.path),
  TypedGoRoute<CookRoute>(path: CookRoute.path),
  TypedGoRoute<CookRecipeRoute>(path: '${CookRoute.path}/:id'),
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
  static const path = searchPath;
  @override
  Widget build(BuildContext context, GoRouterState state) => const SearchPage();
}

@immutable
class CookRoute extends GoRouteData {
  static const path = cookPath;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const CookPageNoRecipes();
}

@immutable
class CookRecipeRoute extends GoRouteData {
  static const path = '/$cookRecipePathRoot/:id';
  final int id;

  const CookRecipeRoute({
    required this.id,
  });

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      CookRecipePage(recipeId: id);
}

@immutable
class SettingsRoute extends GoRouteData {
  static const path = settingsPath;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SettingsPage();
}

@immutable
class ShoppingRoute extends GoRouteData {
  static const path = shoppingPath;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ShoppingPage();
}

@immutable
class WizardRoute extends GoRouteData {
  static const path = wizardPath;
  @override
  Widget build(BuildContext context, GoRouterState state) => const WizardPage();
}
