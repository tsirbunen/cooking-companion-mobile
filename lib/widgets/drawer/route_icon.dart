import 'package:flutter/material.dart';

const iconSize = 34.0;

class RouteIcon extends StatelessWidget {
  final IconData iconData;
  const RouteIcon({super.key, required this.iconData});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.onTertiary;

    return Icon(
      iconData,
      size: iconSize,
      color: color,
    );
  }
}
