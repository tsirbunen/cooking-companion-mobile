import 'package:flutter/material.dart';
import 'package:mobile/presentation/pages/cook_page.dart';
import 'package:mobile/presentation/pages/home_page.dart';
import 'package:mobile/presentation/pages/search_page.dart';
import 'package:mobile/presentation/pages/settings_page.dart';

enum RouteEnum {
  home,
  search,
  cook,
  settings,
}

extension DrawerExtension on RouteEnum {
  IconData get iconData => {
        RouteEnum.home: Icons.home_outlined,
        RouteEnum.search: Icons.search_outlined,
        RouteEnum.cook: Icons.restaurant_outlined,
        RouteEnum.settings: Icons.settings_outlined,
      }[this]!;

  String get label => {
        RouteEnum.home: 'Home',
        RouteEnum.search: 'Search',
        RouteEnum.cook: 'Cook',
        RouteEnum.settings: 'Settings',
      }[this]!;

  String get path => {
        RouteEnum.home: HomePage.path,
        RouteEnum.search: SearchPage.path,
        RouteEnum.cook: CookPage.path,
        RouteEnum.settings: SettingsPage.path,
      }[this]!;
}
