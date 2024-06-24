import 'package:flutter/material.dart';
import 'package:mobile/widgets/app_bar/app_bar_customized.dart';
import 'package:mobile/widgets/drawer/drawer_customized.dart';

const String notImplemented = 'Not implemented';

class PageBase extends StatelessWidget {
  final Widget pageBody;
  final bool hideAppBar;
  const PageBase({super.key, required this.pageBody, this.hideAppBar = false});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBarCustomized(hideContent: hideAppBar),
      drawer: const DrawerCustomized(),
      backgroundColor: hideAppBar ? Colors.transparent : colors.surface,
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
      ),
    );
  }
}
