import 'package:flutter/material.dart';
import 'package:mobile/business_logic/models/tag/tag.dart';
import 'package:mobile/presentation/widgets/tag_with_hashtag/tag_with_hashtag.dart';

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
    return Wrap(
      alignment: WrapAlignment.center,
      children: tags
          .map((tag) => Padding(
                padding: padding,
                child: TagWithHashtag(
                  tagElement: (id: tag.id, content: tag.tag),
                ),
              ))
          .toList(),
    );
  }
}
