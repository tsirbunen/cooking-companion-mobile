import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/features/recipes/application/cooking_recipe_provider/cooking_single_recipe_provider.dart';
import 'package:mobile/widgets/photo_with_fallback_icon/photo_with_fallback_icon.dart';

const double photoHeight = 400.0;

class RecipePhotos extends ConsumerWidget {
  final CookingProvider? cookingProvider;

  const RecipePhotos({super.key, this.cookingProvider});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = MediaQuery.of(context).size;
    final photoWidth = screenSize.width;
    final photos = cookingProvider != null
        ? ref.watch(cookingProvider!)!.recipe.photos
        : [];

    if (photos!.isEmpty) {
      return Container(
        width: photoWidth,
        color: Colors.transparent,
      );
    }

    return PhotoWithFallbackIcon(
      size: Size(
        photoWidth,
        photoHeight,
      ),
      photo: photos[0],
    );
  }
}
