import 'package:flutter/material.dart';

const String nothingAddedText = 'No content yet';

class NoContentYet extends StatelessWidget {
  const NoContentYet({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final style = Theme.of(context).textTheme.titleMedium!.copyWith(
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w400,
        color: themeData.colorScheme.onSecondary);

    return Text(nothingAddedText, style: style);
  }
}
