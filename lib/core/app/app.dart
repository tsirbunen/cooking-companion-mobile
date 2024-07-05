import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/core/dependency_injection/setup_dependency_injection.dart';
import 'package:mobile/core/router/router_provider.dart';
import 'package:mobile/core/theme/app_theme.dart';
import 'package:mobile/layers/business_logic/wizard/wizard_bloc.dart';

class CookingCompanionApp extends ConsumerWidget {
  const CookingCompanionApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider).buildRouter();

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: getIt.get<WizardBloc>(),
        )
      ],
      child: MaterialApp.router(
        routerConfig: router,
        theme: const AppTheme().themeData,
      ),
    );
  }
}
