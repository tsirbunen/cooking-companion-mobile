import 'package:flutter/material.dart';
import 'package:mobile/presentation/widgets/app_bar/app_bar_customized.dart';
import 'package:mobile/presentation/widgets/drawer/drawer_customized.dart';
import 'package:mobile/presentation/widgets/progress_indicator/progress_indicator_page_overlay.dart';

class PageBase extends StatelessWidget {
  final Widget pageBody;
  final bool isDarkBackground;
  final bool showProgressIndicator;

  const PageBase({
    super.key,
    required this.pageBody,
    this.isDarkBackground = false,
    this.showProgressIndicator = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: const AppBarCustomized(hideContent: false),
      drawer: const DrawerCustomized(),
      backgroundColor: isDarkBackground ? colors.primary : colors.surface,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return ProgressIndicatorPageOverlay(
            isSubmitting: showProgressIndicator,
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                  minWidth: viewportConstraints.maxWidth,
                ),
                child: pageBody,
              ),
            ),
          );
        },
      ),
    );
  }
}
