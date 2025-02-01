import 'package:flutter/material.dart';

enum StyleType { normal, danger }

const double defaultLabelPadding = 15.0;
const double defaultFontSize = 20.0;

class ButtonStyled extends StatelessWidget {
  final Function()? onPressed;
  final String label;
  final double fontSize;
  final double labelPadding;
  final StyleType styleType;
  final bool isDisabled;

  const ButtonStyled({
    super.key,
    this.onPressed,
    required this.label,
    this.fontSize = defaultFontSize,
    this.labelPadding = defaultLabelPadding,
    this.styleType = StyleType.normal,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return ElevatedButton(
      onPressed: isDisabled ? null : onPressed,
      style: _getButtonStyle(
        themeData,
      ),
      child: Text(
        label,
        style: _getTextStyle(themeData),
      ),
    );
  }

  ButtonStyle _getButtonStyle(
    ThemeData themeData,
  ) {
    final colors = themeData.colorScheme;
    final Color activeColor = styleType == StyleType.danger
        ? colors.onTertiaryFixed
        : colors.secondaryContainer;
    final Color activeBg = styleType == StyleType.danger
        ? colors.onSecondaryFixed
        : colors.onSecondary;
    final Color disabledColor = colors.tertiaryContainer;
    final Color disabledBg = colors.onTertiaryFixed;

    return ElevatedButton.styleFrom(
      backgroundColor: activeBg,
      foregroundColor: activeColor,
      disabledBackgroundColor: disabledBg,
      disabledForegroundColor: disabledColor,
      shape: const StadiumBorder(),
      padding: EdgeInsets.symmetric(horizontal: labelPadding),
    );
  }

  TextStyle _getTextStyle(ThemeData themeData) {
    return const TextStyle(
      fontSize: defaultFontSize,
      fontWeight: FontWeight.w600,
    );
  }
}
