import 'package:flutter/material.dart';
import 'package:mobile/app_services/router/route_enum/route_enum.dart';

extension DrawerExtension on RouteEnum {
  IconData get iconData => {
        RouteEnum.home: Icons.home_outlined,
        RouteEnum.search: Icons.search_outlined,
        RouteEnum.cook: Icons.restaurant_outlined,
        RouteEnum.wizard: Icons.list,
        RouteEnum.shopping: Icons.shopping_cart_outlined,
        RouteEnum.settings: Icons.settings_outlined,
        RouteEnum.account: Icons.account_circle_outlined,
      }[this]!;

  String get label => {
        RouteEnum.home: 'Home',
        RouteEnum.search: 'Search',
        RouteEnum.cook: 'Cook',
        RouteEnum.settings: 'Settings',
        RouteEnum.shopping: 'Shopping',
        RouteEnum.wizard: 'Wizard',
        RouteEnum.account: 'Account',
      }[this]!;
}

final routeNames = RouteEnum.values.map((e) => e.label).toList();
