import 'package:get_it/get_it.dart';
import 'package:mobile/app_services/api_service/api_service.dart';
import 'package:mobile/business_logic/account_logic/account_bloc.dart';
import 'package:mobile/business_logic/account_logic/account_event.dart';
import 'package:mobile/business_logic/all_recipes_logic/all_recipes_bloc.dart';
import 'package:mobile/business_logic/cook_logic/cook_bloc.dart';
import 'package:mobile/business_logic/search_logic/search_bloc.dart';
import 'package:mobile/business_logic/wizard_logic/wizard_bloc.dart';
import 'package:mobile/repositories/account/repositories/api_account_repository.dart';
import 'package:mobile/repositories/recipes/repositories/recipe_repository.dart';

// We use the service locator pattern to provide instances of the blocs so that
// for example bloc-to-bloc communication is easier. We also prepare all the blocs
// here (like pass the necessary repositories and add initializing events where needed).
final getIt = GetIt.instance;

void prepareBlocs() {
  final apiService = ApiService();
  apiService.initialize(withQueryInterceptor: true);

  final recipeRepository = RecipeRepository(apiService);
  final accountRepository = ApiAccountRepository(apiService);

  final accountBloc = AccountBloc(accountRepository)
    ..add(PrepareValidationFns());

  getIt.registerSingleton<AllRecipesBloc>(AllRecipesBloc(recipeRepository));
  getIt.registerSingleton<SearchBloc>(SearchBloc(recipeRepository));
  getIt.registerSingleton<WizardBloc>(WizardBloc(recipeRepository));
  getIt.registerSingleton<CookBloc>(CookBloc(recipeRepository));
  getIt.registerSingleton<AccountBloc>(accountBloc);
}
