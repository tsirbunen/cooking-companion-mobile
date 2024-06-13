import 'package:flutter/material.dart';

const double dividerWidth = 0.75;

class RouteDivider extends StatelessWidget {
  const RouteDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.tertiaryContainer;

    return Container(
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(
          width: dividerWidth,
          color: color,
        ),
      )),
    );
  }
}
