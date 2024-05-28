import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const double dividerWidth = 2.0;

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
        const Divider(),
        GestureDetector(
          onTap: () => _navigateToPath(context),
          child: Row(
            children: [
              RouteIcon(iconData: iconData),
              RouteLabel(label: routeLabel),
            ],
          ),
        )
      ],
    );
  }

  void _navigateToPath(BuildContext context) {
    debugPrint('Navigate to route path $path');
    context.go(path);
  }
}

class Divider extends StatelessWidget {
  const Divider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: dividerWidth),
        ),
      ),
    );
  }
}

class RouteIcon extends StatelessWidget {
  final IconData iconData;
  const RouteIcon({super.key, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Icon(iconData);
  }
}

class RouteLabel extends StatelessWidget {
  final String label;
  const RouteLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(label);
  }
}