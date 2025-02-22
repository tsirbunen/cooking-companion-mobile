import 'package:flutter/material.dart';
import 'package:mobile/app_services/router/route_enum/route_enum_drawer_extension.dart';
import 'package:mobile/app_services/router/route_enum/route_enum_path_extension.dart';
import 'package:mobile/presentation/widgets/drawer/drawer_route.dart';
import 'package:mobile/presentation/widgets/drawer/route_header.dart';
import 'package:mobile/app_services/router/route_enum/route_enum.dart';

const padding = 10.0;

class DrawerCustomized extends StatelessWidget {
  const DrawerCustomized({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const ContinuousRectangleBorder(),
      child: Container(
        padding: const EdgeInsets.all(padding),
        child: ListView(
          children: [
            const RouteHeader(),
            ...RouteEnum.values.map(
              (route) => DrawerRoute(
                routeLabel: route.label,
                iconData: route.iconData,
                path: route.path(),
              ),
            ),
          ].toList(),
        ),
      ),
    );
  }
}
