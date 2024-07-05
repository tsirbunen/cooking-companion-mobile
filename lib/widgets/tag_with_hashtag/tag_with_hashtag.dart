import 'package:flutter/material.dart';
import 'package:mobile/layers/business_logic/wizard/wizard_event.dart';

const double containerBorderRadius = 100.0;
const double tagBorderRadius = 10.0;
const EdgeInsets padding = EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0);

class TagWithHashtag extends StatelessWidget {
  final TagElement tagElement;
  final bool isDarkTheme;

  const TagWithHashtag({
    super.key,
    required this.tagElement,
    this.isDarkTheme = false,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Container(
      decoration: _getContainerDecoration(themeData),
      child: Padding(
        padding: padding,
        child: Text(
          _getLabel(tagElement.content),
          style: _getTagStyle(themeData),
        ),
      ),
    );
  }

  _getLabel(String label) {
    return '#${label.toUpperCase()}';
  }

  _getContainerDecoration(ThemeData themeData) {
    final colors = themeData.colorScheme;
    return BoxDecoration(
      color: isDarkTheme ? colors.tertiaryContainer : colors.onTertiaryFixed,
      borderRadius: BorderRadius.circular(tagBorderRadius),
    );
  }

  _getTagStyle(ThemeData themeData) {
    final colors = themeData.colorScheme;
    return themeData.textTheme.headlineSmall!.copyWith(
      color: isDarkTheme ? colors.secondaryContainer : colors.tertiary,
    );
  }
}
