import 'package:go_router/go_router.dart';
import 'package:mobile/core/logger/logger.dart';
import 'package:mobile/core/router/route_enum.dart';
import 'package:mobile/core/router/route_enum_go_route_extension.dart';
import 'package:talker_flutter/talker_flutter.dart';

List<GoRoute> routes = RouteEnum.values.map((e) => e.goRoute()).toList();

final router = GoRouter(
  routes: routes,
  observers: [TalkerRouteObserver(logger.talker!)],
);
