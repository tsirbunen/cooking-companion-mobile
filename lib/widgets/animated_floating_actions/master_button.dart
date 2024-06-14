import 'package:flutter/material.dart';
import 'package:mobile/widgets/animated_floating_actions/constant_values.dart';

/// A button that controls the animation status of the actual action buttons.
class MasterButton extends StatelessWidget {
  final void Function() onPressed;
  const MasterButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Positioned(
      right: 0.0,
      bottom: 0.0,
      child: Material(
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(masterButtonBorderRadius),
        ),
        child: Center(
          child: Ink(
            decoration: ShapeDecoration(
              color: colors.secondaryContainer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(masterButtonBorderRadius),
              ),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.build,
                size: iconSize,
              ),
              color: colors.secondary,
              onPressed: onPressed,
            ),
          ),
        ),
      ),
    );
  }
}
