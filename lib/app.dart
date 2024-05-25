import 'package:flutter/material.dart';
import 'package:mobile/presentation/pages/home_page.dart';
import 'package:mobile/router/router.dart';

class CookingCompanionApp extends StatelessWidget {
  const CookingCompanionApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return const MaterialApp(
    //   title: 'Flutter Demo',
    //   home: HomePage(),
    // );
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
