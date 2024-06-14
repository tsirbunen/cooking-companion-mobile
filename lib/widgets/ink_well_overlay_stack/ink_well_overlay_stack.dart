import 'package:flutter/material.dart';

/// This widget stacks an InkWell widget (that is inside a Material
/// widget) on top of the actual content to enable a ripple effect
/// spread over all of the content  as one, especially when the content
/// is made up of multiple child widgets, one of which is an image
/// constructed with the Image.network constructor.
class InkWellOverlayStack extends StatelessWidget {
  final Widget child;
  final void Function() onTap;
  final double width;
  final double height;

  const InkWellOverlayStack({
    super.key,
    required this.child,
    required this.onTap,
    required this.width,
    required this.height,
  });

  // Note: the ripple effect does not work if the child is made
  // the child of the InkWell widget and / or if an Ink widget is
  // placed in between.
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: onTap,
            child: Container(
              width: width,
              height: height,
              color: Colors.transparent,
            ),
          ),
        )
      ],
    );
  }
}
