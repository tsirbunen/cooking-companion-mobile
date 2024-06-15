import 'package:flutter/material.dart';

const String appTitle = 'Cooking companion';
const String defaultRoute = 'HOME';
const double textHeight = 1.15;
const double routeFontSize = 22.0;

class AppTitleWithRoute extends StatelessWidget {
  const AppTitleWithRoute({super.key});

  @override
  Widget build(BuildContext context) {
    final baseStyle = Theme.of(context).textTheme.titleMedium;
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          appTitle,
          style: _getTitleStyle(baseStyle!, colors),
        ),
        Text(
          _getCurrentRoute(context),
          style: _getRouteStyle(baseStyle, colors),
        ),
      ],
    );
  }

  String _getCurrentRoute(BuildContext context) {
    final routeRaw =
        (ModalRoute.of(context)?.settings.name?.replaceAll('/', ''));
    if (routeRaw == null || routeRaw.isEmpty) return defaultRoute;
    return routeRaw.toUpperCase();
  }

  TextStyle _getTitleStyle(TextStyle baseStyle, ColorScheme colors) {
    return baseStyle.copyWith(
      color: colors.tertiaryContainer,
      height: textHeight,
    );
  }

  TextStyle _getRouteStyle(TextStyle baseStyle, ColorScheme colors) {
    return baseStyle.copyWith(
      color: colors.tertiaryFixedDim,
      height: textHeight,
      fontWeight: FontWeight.w700,
      fontSize: routeFontSize,
    );
  }
}
