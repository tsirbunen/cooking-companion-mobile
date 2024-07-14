import 'package:flutter/material.dart';

const double borderRadius = 10.0;
const double padding = 10.0;
const double textHeight = 1.15;
const double marginBottom = 5.0;

class TextInContainer extends StatelessWidget {
  final String text;
  final int maxLines;

  const TextInContainer(
      {super.key, required this.text, required this.maxLines});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(bottom: marginBottom),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: themeData.colorScheme.tertiaryContainer,
      ),
      child: Padding(
        padding: const EdgeInsets.all(padding),
        child: Text(
          text,
          style: themeData.textTheme.headlineSmall!.copyWith(
            color: themeData.colorScheme.secondaryContainer,
            height: textHeight,
            fontWeight: FontWeight.w500,
          ),
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
          softWrap: true,
        ),
      ),
    );
  }
}
