import 'package:flutter/material.dart';
import 'package:mobile/widgets/page_base/page_base.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.menu_outlined),
      onPressed: () => _openDrawer(context),
    );
  }

  void _openDrawer(BuildContext context) {
    debugPrint('Open drawer');
    Scaffold.of(context).openDrawer();
    // scaffoldKey.currentState!.openDrawer();
  }
}
