import 'package:get_it/get_it.dart';
import 'package:mobile/layers/business_logic/wizard/wizard_bloc.dart';

final getIt = GetIt.instance;

void setupDependencyInjection() {
  getIt.registerSingleton<WizardBloc>(WizardBloc());
}
