import 'package:flutter/material.dart';

const String appTitle = 'Cooking companion';

class AppTitle extends StatelessWidget {
  const AppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.titleMedium;

    return Text(
      appTitle,
      style: style,
    );
  }
}
