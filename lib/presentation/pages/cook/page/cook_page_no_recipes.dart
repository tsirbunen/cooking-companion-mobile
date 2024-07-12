import 'package:flutter/material.dart';
import 'package:mobile/app_services/router/route_enum.dart';
import 'package:mobile/presentation/widgets/route_description_with_navigation/route_description_with_navigation.dart';
import 'package:mobile/presentation/widgets/page_base/page_base.dart';

const double padding = 25.0;
const String noPickedRecipesText =
    'Hmm. Seems that you have not picked any recipes to cook yet. Why not search for some?';

class CookPageNoRecipes extends StatelessWidget {
  const CookPageNoRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    final infoStyle = Theme.of(context).textTheme.bodyMedium;

    return PageBase(
      pageBody: Padding(
        padding: const EdgeInsets.all(padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              noPickedRecipesText,
              style: infoStyle,
            ),
            const RouteDescriptionWithNavigation(route: RouteEnum.search)
          ],
        ),
      ),
    );
  }
}
