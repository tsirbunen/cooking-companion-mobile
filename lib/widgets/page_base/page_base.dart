import 'package:flutter/material.dart';
import 'package:mobile/widgets/app_bar/app_bar_customized.dart';
import 'package:mobile/widgets/drawer/drawer_customized.dart';

class PageBase extends StatelessWidget {
  final Widget pageBody;
  const PageBase({super.key, required this.pageBody});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
        appBar: const AppBarCustomized(hideContent: false),
        drawer: const DrawerCustomized(),
        backgroundColor: colors.surface,
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                  minWidth: viewportConstraints.maxWidth,
                ),
                child: pageBody,
              ),
            );
          },
        ));
  }
}
