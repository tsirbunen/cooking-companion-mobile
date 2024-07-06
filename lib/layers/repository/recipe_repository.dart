import 'package:mobile/core/api_service/api_service.dart';
import 'package:mobile/core/logger/logger.dart';
import 'package:mobile/features/recipes/domain/models/recipe/recipe.dart';
import 'package:mobile/layers/repository/create_recipe_graph_ql.dart';
import 'package:mobile/layers/repository/models/create_recipe_input/create_recipe_input.dart';

class RecipeRepository {
  final ApiService _apiService;

  RecipeRepository(this._apiService);

  // Future<List<Recipe>> getAllRecipes() async {
  //   return [];
  // }

  Future<Recipe?> createRecipe(CreateRecipeInput input) async {
    logger.warning('create recipe ${input.title}', runtimeType);
    final query = CreateRecipeMutation();
    final variables = {
      'recipeInput': input.toJson(),
    };

    final response = await _apiService.performMutation(
      query.query,
      variables,
    );
    print(response);

    return null;
  }
}
