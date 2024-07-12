import 'package:get_it/get_it.dart';
import 'package:mobile/app_services/api_service/api_service.dart';
import 'package:mobile/business_logic/all_recipes_logic/all_recipes_bloc.dart';
import 'package:mobile/business_logic/cook_logic/cook_bloc.dart';
import 'package:mobile/business_logic/search_logic/search_bloc.dart';
import 'package:mobile/business_logic/wizard_logic/wizard_bloc.dart';
import 'package:mobile/repositories_and_data/repositories/recipe_repository.dart';

final getIt = GetIt.instance;

void prepareBlocs() {
  // Create a singleton api service instance to use throughout the app.
  final apiService = ApiService();
  apiService.initialize(withQueryInterceptor: true);

  // Give the api service instance to the repositories.
  final recipeRepository = RecipeRepository(apiService);

  // Register all blocs (with injection of the repository instance).
  getIt.registerSingleton<AllRecipesBloc>(AllRecipesBloc(recipeRepository));
  getIt.registerSingleton<SearchBloc>(SearchBloc(recipeRepository));
  getIt.registerSingleton<WizardBloc>(WizardBloc(recipeRepository));
  getIt.registerSingleton<CookBloc>(CookBloc(recipeRepository));
}
