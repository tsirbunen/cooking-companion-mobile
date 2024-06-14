import 'package:flutter/material.dart';
import 'package:mobile/features/recipes/domain/models/photo/photo.dart';

class ImageInCard extends StatelessWidget {
  final Photo? photo;
  final Size size;
  const ImageInCard({super.key, this.photo, required this.size});

  @override
  Widget build(BuildContext context) {
    if (photo == null) {
      // FIXME: Add here a placeholder image
      return SizedBox(
        width: size.width,
        height: size.height,
      );
    }

    return Image.network(
      photo!.url,
      fit: BoxFit.cover,
      width: size.width,
      height: size.height,
    );
  }
}
