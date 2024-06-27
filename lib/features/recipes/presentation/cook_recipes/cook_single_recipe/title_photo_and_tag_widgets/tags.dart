import 'package:flutter/material.dart';
import 'package:mobile/features/recipes/domain/models/tag/tag.dart';

const double containerBorderRadius = 100.0;
const double tagBorderRadius = 10.0;
const EdgeInsets padding = EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0);

class Tags extends StatelessWidget {
  final List<Tag> tags;

  const Tags({
    super.key,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Wrap(
      alignment: WrapAlignment.center,
      children: tags
          .map((tag) => Padding(
                padding: padding,
                child: Container(
                  decoration: _getContainerDecoration(themeData),
                  child: Padding(
                    padding: padding,
                    child: Text(
                      _getLabel(tag),
                      style: _getTagStyle(themeData),
                    ),
                  ),
                ),
              ))
          .toList(),
    );
  }

  _getContainerDecoration(ThemeData themeData) {
    return BoxDecoration(
      color: themeData.colorScheme.onTertiaryFixed,
      borderRadius: BorderRadius.circular(tagBorderRadius),
    );
  }

  _getLabel(Tag tag) {
    return '#${tag.tag.toUpperCase()}';
  }

  _getTagStyle(ThemeData themeData) {
    final colors = themeData.colorScheme;
    return themeData.textTheme.headlineSmall!.copyWith(
      color: colors.tertiary,
    );
  }
}
