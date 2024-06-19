import 'package:flutter/material.dart';
import 'package:mobile/features/recipes/domain/models/recipe/recipe.dart';
import 'package:mobile/widgets/page_base/page_base.dart';

class CookRecipe extends StatelessWidget {
  final int recipeId;
  const CookRecipe({super.key, required this.recipeId});

  @override
  Widget build(BuildContext context) {
    return PageBase(
      pageBody: Container(
        child: Column(
          children: [Text(recipeId.toString())],
        ),
      ),
    );
  }
}
