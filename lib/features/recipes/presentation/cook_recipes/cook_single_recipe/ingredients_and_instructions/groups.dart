import 'package:flutter/material.dart';

class Groups extends StatelessWidget {
  final String title;
  final List<Widget> groups;

  const Groups({
    super.key,
    required this.title,
    required this.groups,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: themeData.colorScheme.surface,
        border: Border.all(
          color: themeData.colorScheme.surface,
          width: 1.0,
        ),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: _getTitleStyle(themeData)),
            Divider(
              height: 20.0,
              thickness: 1.0,
              color: themeData.colorScheme.primaryContainer,
            ),
            ...groups,
          ],
        ),
      ),
    );
  }

  _getTitleStyle(ThemeData themeData) {
    return themeData.textTheme.headlineSmall!.copyWith(
      color: themeData.colorScheme.tertiary,
      fontSize: 19.0,
    );
  }
}
