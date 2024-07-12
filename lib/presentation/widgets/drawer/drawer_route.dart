import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/presentation/widgets/drawer/route_divider.dart';
import 'package:mobile/presentation/widgets/drawer/route_icon.dart';
import 'package:mobile/presentation/widgets/drawer/route_label.dart';

const verticalPadding = 15.0;

class DrawerRoute extends StatelessWidget {
  final String routeLabel;
  final IconData iconData;
  final String path;

  const DrawerRoute({
    super.key,
    required this.routeLabel,
    required this.iconData,
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const RouteDivider(),
        GestureDetector(
          onTap: () => _navigateToRoute(context),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: verticalPadding),
            child: Row(
              children: [
                RouteIcon(iconData: iconData),
                RouteLabel(label: routeLabel),
              ],
            ),
          ),
        )
      ],
    );
  }

  void _navigateToRoute(BuildContext context) {
    Navigator.of(context).pop();
    context.go(path);
  }
}
