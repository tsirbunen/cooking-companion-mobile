import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/app_services/router/route_enum.dart';
import 'package:mobile/app_services/router/route_enum_description_extension.dart';
import 'package:mobile/app_services/router/route_enum_drawer_extension.dart';
import 'package:mobile/app_services/router/route_enum_path_extension.dart';
import 'package:mobile/presentation/widgets/drawer/route_icon.dart';

const double padding = 25.0;
const double labelLineHeight = 1.75;
const double borderRadius = 10;
const double containerPadding = padding / 2.0;

class RouteDescriptionWithNavigation extends StatelessWidget {
  final RouteEnum route;

  const RouteDescriptionWithNavigation({super.key, required this.route});

  @override
  Widget build(BuildContext context) {
    final labelStyle = Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontWeight: FontWeight.w700,
          height: labelLineHeight,
        );
    final descriptionStyle = Theme.of(context).textTheme.bodyMedium;

    return InkWell(
      borderRadius: BorderRadius.circular(borderRadius),
      onTap: () => _navigateToRoute(context),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: containerPadding),
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
