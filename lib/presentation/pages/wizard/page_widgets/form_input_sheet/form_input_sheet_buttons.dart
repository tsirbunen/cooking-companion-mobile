import 'package:flutter/material.dart';

const String saveLabel = 'SAVE';
const String cancelLabel = 'CANCEL';
const String deleteLabel = 'DELETE';
const double padding = 20.0;
const double spacing = 5.0;
const double labelFontSize = 19.0;
const double buttonTextPadding = 15.0;

class FormInputSheetButtons extends StatelessWidget {
  final void Function()? onDelete;
  final void Function() onCancel;
  final void Function() onSave;

  const FormInputSheetButtons({
    super.key,
    this.onDelete,
    required this.onCancel,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    const labelStyle = TextStyle(fontSize: labelFontSize);
    final buttonStyle = _getButtonStyle(themeData);

    return Padding(
      padding: const EdgeInsets.only(top: padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          if (onDelete != null)
            ElevatedButton(
              onPressed: onDelete,
              style: buttonStyle,
              child: const Text(deleteLabel, style: labelStyle),
            ),
          if (onDelete != null) const SizedBox(width: spacing),
          ElevatedButton(
            onPressed: onCancel,
            style: buttonStyle,
            child: const Text(cancelLabel, style: labelStyle),
          ),
          const SizedBox(width: spacing),
          ElevatedButton(
            onPressed: onSave,
            style: buttonStyle,
            child: const Text(saveLabel, style: labelStyle),
          ),
        ],
      ),
    );
  }

  ButtonStyle _getButtonStyle(ThemeData themeData) {
    final colors = themeData.colorScheme;
    final Color activeBg = colors.secondaryContainer;
    final Color activeColor = colors.secondary;
    final Color disabledBg = colors.tertiaryContainer;
    final Color disabledColor = colors.onTertiaryFixed;

    return ElevatedButton.styleFrom(
      backgroundColor: activeBg,
      foregroundColor: activeColor,
      disabledBackgroundColor: disabledBg,
      disabledForegroundColor: disabledColor,
      shape: const StadiumBorder(),
      padding: const EdgeInsets.symmetric(horizontal: buttonTextPadding),
    );
  }
}
