import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/app_services/blocs/blocs.dart';
import 'package:mobile/app_services/router/router.dart';
import 'package:mobile/app_services/theme/app_theme.dart';
import 'package:mobile/business_logic/all_recipes_logic/all_recipes_bloc.dart';
import 'package:mobile/business_logic/cook_logic/cook_bloc.dart';
import 'package:mobile/business_logic/search_logic/search_bloc.dart';
import 'package:mobile/business_logic/wizard_logic/wizard_bloc.dart';

class CookingCompanionApp extends StatelessWidget {
  const CookingCompanionApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = RouterController().buildRouter();

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: getIt.get<AllRecipesBloc>()),
        BlocProvider.value(value: getIt.get<WizardBloc>()),
        BlocProvider.value(value: getIt.get<SearchBloc>()),
        BlocProvider.value(value: getIt.get<CookBloc>()),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        theme: const AppTheme().themeData,
      ),
    );
  }
}
