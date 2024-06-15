import 'package:flutter/material.dart';
import 'package:mobile/widgets/app_bar/app_title_with_route.dart';
import 'package:mobile/widgets/app_bar/menu_button.dart';

const double appBarHeight = 90.0;

class AppBarCustomized extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustomized({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      height: appBarHeight,
      decoration: BoxDecoration(color: colors.secondaryContainer),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MenuButton(),
                SizedBox(width: 10.0),
                // Note: There will be other widgets here in the future,
                // hence the use of a row.
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppTitleWithRoute(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(appBarHeight);
}
