import 'package:flutter/material.dart';
import 'package:mobile/presentation/pages/search/recipe_as_card/title_in_card.dart';

class TitleInList extends StatelessWidget {
  final String title;

  const TitleInList({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.headlineSmall;

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: textPadding),
            child: Text(
              title,
              style: titleStyle,
              maxLines: 1,
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
