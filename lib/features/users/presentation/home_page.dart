import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/router/route_enum.dart';
import 'package:mobile/core/router/route_enum_description_extension.dart';
import 'package:mobile/core/router/route_enum_drawer_extension.dart';
import 'package:mobile/core/router/route_enum_path_extension.dart';
import 'package:mobile/widgets/drawer/route_icon.dart';
import 'package:mobile/widgets/page_base/page_base.dart';

const String appIntroText =
    'Goodbye intrusive ads and sifting through lengthy blog posts. Welcome easy browsing and streamlined cooking of multiple recipes simultaneously on one site.';
const double padding = 25.0;
const double labelLineHeight = 1.75;

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
              (route) => PageDescriptionWithNavigation(route: route),
            ),
          ],
        ),
      ),
    );
  }
}

class PageDescriptionWithNavigation extends StatelessWidget {
  final RouteEnum route;

  const PageDescriptionWithNavigation({super.key, required this.route});

  @override
  Widget build(BuildContext context) {
    final labelStyle = Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontWeight: FontWeight.w700,
          height: labelLineHeight,
        );
    final descriptionStyle = Theme.of(context).textTheme.bodyMedium;

    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () => _navigateToRoute(context),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: padding / 1.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: padding),
              child: RouteIcon(iconData: route.iconData),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    route.label.toUpperCase(),
                    style: labelStyle,
                    softWrap: true,
                  ),
                  Text(
                    route.description(),
                    style: descriptionStyle,
                    softWrap: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToRoute(BuildContext context) {
    context.go(route.path());
  }
}
