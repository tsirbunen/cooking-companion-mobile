import 'package:flutter/material.dart';

const double menuButtonContainerSize = 55.0;
const double menuIconSize = 40.0;

class MenuButton extends StatelessWidget {
  const MenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: menuButtonContainerSize,
      height: menuButtonContainerSize,
      child: IconButton(
        icon: Icon(
          Icons.menu_outlined,
          size: menuIconSize,
          color: colors.secondary,
        ),
        onPressed: () => _openDrawer(context),
      ),
    );
  }

  void _openDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }
}
