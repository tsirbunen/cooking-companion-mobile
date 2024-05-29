import 'package:flutter/material.dart';
import 'package:mobile/core/router/router.dart';

class CookingCompanionApp extends StatelessWidget {
  const CookingCompanionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}