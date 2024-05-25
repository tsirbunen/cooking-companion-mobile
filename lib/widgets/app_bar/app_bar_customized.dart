import 'package:flutter/material.dart';
import 'package:mobile/widgets/app_bar/app_title.dart';
import 'package:mobile/widgets/app_bar/menu_button.dart';

const double appBarHeight = 85.0;

class AppBarCustomized extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustomized({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: appBarHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MenuButton(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppTitle(),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(appBarHeight);
}
