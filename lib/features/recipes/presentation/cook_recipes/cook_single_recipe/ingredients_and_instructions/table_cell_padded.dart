import 'package:flutter/material.dart';

class TableCellPadded extends StatelessWidget {
  final Widget? widget;
  final String? text;
  final FontWeight? fontWeight;

  const TableCellPadded({
    super.key,
    this.widget,
    this.text,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final style = fontWeight != null
        ? themeData.textTheme.displayMedium!.copyWith(fontWeight: fontWeight)
        : themeData.textTheme.displayMedium;

    return TableCell(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5.0),
        child: text != null ? Text(text!, style: style) : widget,
      ),
    );
  }
}
