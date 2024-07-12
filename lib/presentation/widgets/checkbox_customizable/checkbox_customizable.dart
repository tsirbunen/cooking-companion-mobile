import 'package:flutter/material.dart';

const double borderWidth = 2.0;
const double borderRadius = 5.0;
const double baseSize = 24.0;
const double defaultScale = 1.25;

class CheckboxCustomizable extends StatelessWidget {
  final bool isSelected;
  final double scale;
  final void Function() toggle;

  const CheckboxCustomizable({
    super.key,
    required this.isSelected,
    required this.toggle,
    this.scale = defaultScale,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Transform.scale(
      scale: scale,
      child: SizedBox(
        width: baseSize,
        height: baseSize,
        child: Checkbox(
          value: isSelected,
          checkColor: colors.secondary,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          fillColor: WidgetStateProperty.resolveWith<Color>(
            (states) {
              if (states.contains(WidgetState.selected)) {
                return colors.primary;
              }
              return colors.secondary;
            },
          ),
          onChanged: (_) => toggle(),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: colors.primary,
              width: borderWidth,
            ),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
    );
  }
}
