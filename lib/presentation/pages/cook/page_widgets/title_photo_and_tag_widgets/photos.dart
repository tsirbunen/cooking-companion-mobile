import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/business_logic/cook_logic/cook_bloc.dart';
import 'package:mobile/business_logic/cook_logic/cook_state.dart';
import 'package:mobile/presentation/widgets/photo_with_fallback_icon/photo_with_fallback_icon.dart';

const double photoHeight = 400.0;

class RecipePhotos extends StatelessWidget {
  final int recipeId;

  const RecipePhotos({super.key, required this.recipeId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CookBloc, CookState>(builder: (
      BuildContext context,
      CookState state,
    ) {
      final screenSize = MediaQuery.of(context).size;
      final photoWidth = screenSize.width;
      final photos = state.recipeMap[recipeId]?.photos ?? [];

      if (photos.isEmpty) {
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
    });
  }
}
