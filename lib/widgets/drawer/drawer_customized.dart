import 'package:flutter/material.dart';
import 'package:mobile/core/router/router.dart';
import 'package:mobile/widgets/drawer/drawer_route.dart';
import 'package:mobile/widgets/drawer/drawer_title.dart';
import 'package:mobile/widgets/drawer/route_enum_drawer_extension.dart';

class DrawerCustomized extends StatelessWidget {
  const DrawerCustomized({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerTitle(),
          ...RouteEnum.values.map(
            (route) => DrawerRoute(
              routeLabel: route.label,
              iconData: route.iconData,
              path: route.path(),
            ),
          ),
        ].toList(),
      ),
    );
  }
}
