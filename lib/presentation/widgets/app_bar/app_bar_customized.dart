import 'package:flutter/material.dart';
import 'package:mobile/presentation/widgets/app_bar/app_title_with_route.dart';
import 'package:mobile/presentation/widgets/app_bar/menu_button.dart';

const double appBarHeight = 90.0;

class AppBarCustomized extends StatelessWidget implements PreferredSizeWidget {
  final bool hideContent;
  const AppBarCustomized({super.key, this.hideContent = false});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    // Note: when navigating between animated cook recipe pages, we need to hide
    // the app bar from view.
    final color = hideContent ? Colors.transparent : colors.secondaryContainer;

    return Container(
      height: appBarHeight,
      decoration: BoxDecoration(color: color),
      child: hideContent
          ? null
          : const Padding(
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
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(child: AppTitleWithRoute()),
                          ],
                        ),
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
