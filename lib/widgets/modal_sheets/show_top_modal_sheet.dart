import 'package:flutter/material.dart';

Future<T?> showTopModalSheet<T>(
  BuildContext context,
  Widget child, {
  bool barrierDismissible = true,
  BorderRadiusGeometry? borderRadius,
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
