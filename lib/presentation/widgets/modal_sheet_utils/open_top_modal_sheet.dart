import 'package:flutter/material.dart';

const double borderRadius = 20.0;

const defaultBorderRadius = BorderRadius.vertical(
  bottom: Radius.circular(borderRadius),
);

Future<T?> openTopModalSheet<T>(
  BuildContext context,
  Widget child, {
  bool barrierDismissible = false,
  BorderRadiusGeometry borderRadius = defaultBorderRadius,
  Duration transitionDuration = const Duration(milliseconds: 500),
  Color? backgroundColor,
  Color barrierColor = const Color(0x80000000),
  Offset startOffset = const Offset(0, -1.0),
  Curve curve = Curves.easeOutCubic,
}) {
  return showGeneralDialog<T?>(
    context: context,
    barrierDismissible: barrierDismissible,
    transitionDuration: transitionDuration,
    barrierLabel: MaterialLocalizations.of(context).dialogLabel,
    barrierColor: barrierColor,
    pageBuilder: (context, _, __) => child,
    transitionBuilder: (context, animation, _, child) {
      return SlideTransition(
        position: CurvedAnimation(parent: animation, curve: curve)
            .drive(Tween<Offset>(begin: startOffset, end: Offset.zero)),
        child: Column(
          children: [
            Material(
              type: backgroundColor == null
                  ? MaterialType.transparency
                  : MaterialType.canvas,
              color: backgroundColor,
              borderRadius: borderRadius,
              clipBehavior: Clip.antiAlias,
              child: child,
            )
          ],
        ),
      );
    },
  );
}
