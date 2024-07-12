import 'package:flutter/material.dart';
import 'package:mobile/app_services/router/route_enum.dart';
import 'package:mobile/presentation/widgets/route_description_with_navigation/route_description_with_navigation.dart';
import 'package:mobile/presentation/widgets/page_base/page_base.dart';

const String appIntroText =
    'Goodbye intrusive ads and sifting through lengthy blog posts. Welcome easy browsing and streamlined cooking of multiple recipes simultaneously on one site.';
const double padding = 25.0;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
              appIntroText,
              style: infoStyle,
            ),
            ...RouteEnum.values.map(
              (route) {
                return RouteDescriptionWithNavigation(route: route);
              },
            ),
          ],
        ),
      ),
    );
  }
}
