import 'package:flutter/material.dart';
import 'package:mobile/core/theme/colors.dart';

class AppTheme {
  const AppTheme();

  ThemeData get themeData {
    return ThemeData(
      fontFamily: 'Quicksand',
      textTheme: const TextTheme(
        titleMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: veryPale,
        ),
        titleSmall: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: dark,
        ),
        headlineMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: dark,
        ),
        headlineSmall: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: dark,
        ),
        bodyMedium: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.normal,
          color: veryDark,
          height: 1.25,
        ),
        displayMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: veryDark,
        ),
      ),
      colorScheme: ColorScheme.fromSeed(
        surface: background,
        seedColor: dark,
        brightness: Brightness.light,
        primary: veryDark,
        primaryContainer: veryPale,
        secondary: veryPale,
        secondaryContainer: veryDark,
        tertiary: medium,
        tertiaryContainer: pale,
        onTertiary: dark,
        onTertiaryFixed: extremelyPale,
        tertiaryFixedDim: veryPale,
      ),
    );
  }
}
