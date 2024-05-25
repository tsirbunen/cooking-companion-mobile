import 'package:flutter/material.dart';
import 'package:mobile/router/router.dart';

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
}
