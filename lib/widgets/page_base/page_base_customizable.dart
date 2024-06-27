import 'package:flutter/material.dart';
import 'package:mobile/widgets/app_bar/app_bar_customized.dart';
import 'package:mobile/widgets/drawer/drawer_customized.dart';

class PageBaseCustomizable extends StatelessWidget {
  final Widget pageBody;
  final bool hideAppBar;
  final Widget? backgroundWidget;
  final Widget? floatingWidget;

  const PageBaseCustomizable({
    super.key,
    required this.pageBody,
    this.hideAppBar = false,
    this.backgroundWidget,
    this.floatingWidget,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBarCustomized(hideContent: hideAppBar),
      drawer: const DrawerCustomized(),
      backgroundColor: hideAppBar ? Colors.transparent : colors.surface,
      body: Stack(
        children: [
          if (backgroundWidget != null) backgroundWidget!,
          LayoutBuilder(
            builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
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
          if (floatingWidget != null) floatingWidget!,
        ],
      ),
    );
  }
}
