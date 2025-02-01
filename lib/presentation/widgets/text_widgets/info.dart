import 'package:flutter/material.dart';

enum InfoType { multiline, multilinePale }

const defaultPadding = 5.0;

class Info extends StatelessWidget {
  final String info;
  final InfoType type;
  final double padding;

  const Info({
    super.key,
    required this.info,
    this.type = InfoType.multiline,
    this.padding = defaultPadding,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final style = type == InfoType.multilinePale
        ? TextStyle(
            fontSize: 17.0,
            color: Theme.of(context).colorScheme.onTertiary,
          )
        : themeData.textTheme.bodyMedium;

    return Padding(
      padding: EdgeInsets.only(top: padding, bottom: 10.0),
      child: Text(
        info,
        style: style,
        softWrap: true,
      ),
    );
  }
}
