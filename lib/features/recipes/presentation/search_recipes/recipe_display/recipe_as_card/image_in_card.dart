import 'package:flutter/material.dart';
import 'package:mobile/features/recipes/domain/models/photo/photo.dart';
import 'package:mobile/features/recipes/presentation/search_recipes/recipe_display/recipe_as_card/constant_values.dart';

class ImageInCard extends StatelessWidget {
  final Photo? photo;
  const ImageInCard({super.key, this.photo});

  @override
  Widget build(BuildContext context) {
    if (photo == null) {
      return const SizedBox(
        width: cardWidth,
        height: imageHeight,
      );
    }

    return Image.network(
      photo!.url,
      fit: BoxFit.cover,
      width: cardWidth,
      height: imageHeight,
    );
  }
}
