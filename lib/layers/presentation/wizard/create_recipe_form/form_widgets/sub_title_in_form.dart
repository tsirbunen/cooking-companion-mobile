import 'package:flutter/material.dart';

const double paddingTop = 20.0;
const double paddingBottom = 10.0;

class SubTitleInForm extends StatelessWidget {
  final String subTitle;
  final bool isDarkTheme;
  const SubTitleInForm({
    super.key,
    required this.subTitle,
    this.isDarkTheme = true,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final style = themeData.textTheme.titleMedium!.copyWith(
      color: isDarkTheme
          ? themeData.colorScheme.tertiaryContainer
          : themeData.colorScheme.onTertiary,
      fontWeight: FontWeight.bold,
    );
    return Padding(
      padding: const EdgeInsets.only(
        top: paddingTop,
        bottom: paddingBottom,
      ),
      child: Text(subTitle, style: style),
    );
  }
}
