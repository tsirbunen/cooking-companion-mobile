import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/logger/logger.dart';
import 'package:mobile/core/router/routes.dart';
import 'package:mobile/features/recipes/application/cooking_recipe_provider/cooking_recipes_provider.dart';
import 'package:mobile/widgets/page_base/page_base.dart';

class CookPage extends ConsumerStatefulWidget {
  const CookPage({super.key});

  @override
  CookPageState createState() => CookPageState();
}

class CookPageState extends ConsumerState<CookPage> {
  @override
  Widget build(BuildContext context) {
    return PageBase(
      pageBody: Container(
        color: Colors.pink,
        child: Column(
          children: [
            Text('COOK'),
            ElevatedButton(
              onPressed: () {
                context.go('/$cookRecipePathRoot/1');
              },
              child: Text('NEXT'),
            )
          ],
        ),
        // ),
      ),
    );
  }
}
