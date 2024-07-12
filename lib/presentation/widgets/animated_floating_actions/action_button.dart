import 'package:flutter/material.dart';
import 'package:mobile/presentation/widgets/animated_floating_actions/action_button_label.dart';
import 'package:mobile/presentation/widgets/animated_floating_actions/action_config.dart';
import 'package:mobile/presentation/widgets/animated_floating_actions/constant_values.dart';

/// A button that starts off being hidden and then, on forward animation,
/// animates into view with a fade transition and slides up to a location
/// determined by the index of the button. On reversing the animation,
/// the button fades out and slides back down.
class ActionButton extends StatelessWidget {
  final ActionConfig config;
  final Animation<double> expansion;
  final int index;
  final bool showLabel;

  const ActionButton({
    super.key,
    required this.config,
    required this.expansion,
    required this.index,
    required this.showLabel,
  });

  double _calculateTargetOffset() {
    final spacing =
        showLabel ? actionButtonSpacingWithLabel : actionButtonSpacing;
    final baseOffset =
        showLabel ? firstButtonOffsetWithLabel : firstButtonOffset;
    return baseOffset + index * (iconSize + spacing);
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final targetOffset = _calculateTargetOffset();

    return AnimatedBuilder(
      animation: expansion,
      builder: (BuildContext context, Widget? child) {
        final double offset = expansion.value * targetOffset;

        return Positioned(
          bottom: zeroPosition + offset,
          right: zeroPosition,
          child: child!,
        );
      },
      child: FadeTransition(
        opacity: expansion,
        child: Column(
          children: [
            Material(
              elevation: showLabel ? 0.0 : elevation,
              shape: const CircleBorder(),
              clipBehavior: Clip.antiAlias,
              child: Center(
                child: Ink(
                  decoration: ShapeDecoration(
                    color: colors.secondaryContainer,
                    shape: const CircleBorder(),
                  ),
                  child: IconButton(
                    icon: Icon(
                      config.iconData,
                      size: iconSize,
                    ),
                    color: colors.secondary,
                    onPressed: config.onPressed,
                  ),
                ),
              ),
            ),
            const SizedBox(height: labelPaddingTop),
            if (showLabel) ActionButtonLabel(label: config.label),
          ],
        ),
      ),
    );
  }
}
