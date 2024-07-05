import 'package:flutter/material.dart';

const EdgeInsets contentPadding = EdgeInsets.all(20.0);
const double _borderRadius = 10.0;

class TextInputFormField extends StatelessWidget {
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? hintText;
  final int maxLength;
  final bool isDarkTheme;
  final bool shouldAutofocus;
  final bool isNumber;

  const TextInputFormField({
    super.key,
    this.controller,
    this.onChanged,
    this.hintText,
    this.maxLength = 100,
    this.isDarkTheme = true,
    this.shouldAutofocus = true,
    this.isNumber = false,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final Color color = isDarkTheme
        ? themeData.colorScheme.primaryContainer
        : themeData.colorScheme.onTertiary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          onChanged: onChanged,
          controller: controller,
          autofocus: shouldAutofocus,
          decoration: _getTextInputDecoration(themeData, color),
          maxLength: maxLength,
          minLines: 1,
          maxLines: 3,
          style: themeData.textTheme.titleMedium!.copyWith(
            color: color,
          ),
        )
      ],
    );
  }

  InputDecoration _getTextInputDecoration(ThemeData themeData, Color color) {
    final colors = themeData.colorScheme;
    final TextStyle hintStyle = themeData.textTheme.titleMedium!.copyWith(
      fontWeight: FontWeight.normal,
      color: colors.onPrimary,
      fontStyle: FontStyle.italic,
    );

    final borderSide = BorderSide(width: 3.0, color: color);

    return InputDecoration(
      hintText: hintText,
      hintStyle: hintStyle,
      filled: false,
      contentPadding: contentPadding,
      enabledBorder: OutlineInputBorder(
        borderSide: borderSide,
        borderRadius: BorderRadius.circular(_borderRadius),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: borderSide,
        borderRadius: BorderRadius.circular(_borderRadius),
      ),
      counterStyle: themeData.textTheme.titleSmall!.copyWith(
        color: colors.tertiaryContainer,
      ),
    );
  }
}
