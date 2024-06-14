import 'package:flutter/material.dart';

const double fontSizeNormal = 16.0;
const double fontSizeLarge = 22.0;
const double textPadding = 10.0;
const int textMaxLines = 2;

class TitleInCard extends StatelessWidget {
  final String title;
  final bool isLarge;
  final bool isSelected;

  const TitleInCard({
    super.key,
    required this.title,
    required this.isLarge,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textColor = isSelected ? colors.onTertiaryFixed : colors.primary;
    final titleStyle = Theme.of(context).textTheme.titleSmall!.copyWith(
          color: textColor,
          fontSize: isLarge ? fontSizeLarge : fontSizeNormal,
        );

    return Expanded(
      child: Column(
        mainAxisAlignment:
            isLarge ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: textPadding),
            child: Text(
              title,
              style: titleStyle,
              maxLines: textMaxLines,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
