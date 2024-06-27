import 'package:flutter/material.dart';
import 'package:mobile/features/recipes/domain/models/tag/tag.dart';
import 'package:mobile/features/recipes/presentation/cook_recipes/cook_single_recipe/title_photo_and_tag_widgets/tags.dart';

const double titleContainerBorderRadius = 100.0;
const EdgeInsets titlePadding = EdgeInsets.only(top: 20.0, bottom: 10.0);

class TitleAndTags extends StatelessWidget {
  final String title;

  final List<Tag> tags;
  final double width;

  const TitleAndTags({
    super.key,
    required this.title,
    required this.tags,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Container(
      width: width,
      decoration: _getTitleAndTagsContainerDecoration(themeData),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: titlePadding,
            child: Text(title, style: themeData.textTheme.headlineMedium),
          ),
          if (tags.isNotEmpty) Tags(tags: tags)
        ],
      ),
    );
  }

  _getTitleAndTagsContainerDecoration(ThemeData themeData) {
    return BoxDecoration(
      color: themeData.colorScheme.surface,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(titleContainerBorderRadius),
        topRight: Radius.circular(titleContainerBorderRadius),
      ),
      // Note: This "unnecessary" border helps to hide the extremely fine line that
      // appears between the title and the tags for some reason.
      border: Border.all(
        color: themeData.colorScheme.surface,
        width: 1.0,
      ),
    );
  }
}
