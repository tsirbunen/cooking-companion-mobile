import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/core/router/router_provider.dart';
import 'package:mobile/core/theme/app_theme.dart';

class CookingCompanionApp extends ConsumerWidget {
  const CookingCompanionApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider).buildRouter();

    return MaterialApp.router(
      routerConfig: router,
      theme: const AppTheme().themeData,
    );
  }
}
