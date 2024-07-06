import 'package:get_it/get_it.dart';
import 'package:mobile/core/api_service/api_service.dart';
import 'package:mobile/layers/business_logic/wizard/wizard_bloc.dart';
import 'package:mobile/layers/repository/recipe_repository.dart';

final getIt = GetIt.instance;

void setupDependencyInjection() {
  // Create a singleton api service instance to use throughout the app.
  final apiService = ApiService();
  apiService.initialize(withQueryInterceptor: true);

  // Give the api service instance to all the repositories.
  final recipeRepository = RecipeRepository(apiService);

  getIt.registerSingleton<WizardBloc>(WizardBloc(recipeRepository));
}
