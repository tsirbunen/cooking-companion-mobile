import 'package:mobile/app_services/api_service/api_service.dart';
import 'package:mobile/business_logic/models/recipe/recipe.dart';
import 'package:mobile/repositories_and_data/graph_ql/queries_and_mutations/create_recipe_graph_ql.dart';
import 'package:mobile/repositories_and_data/graph_ql/queries_and_mutations/get_all_recipes_graph_ql.dart';
import 'package:mobile/repositories_and_data/models/create_recipe_input/create_recipe_input.dart';
import 'package:mobile/repositories_and_data/models/either/either.dart';
import 'package:mobile/repositories_and_data/models/failure/failure.dart';

const noCreatedRecipeMessage = 'Failed to create recipe!';
const noRecipesMessage = 'Failed to get any recipe data!';

class RecipeRepository {
  final ApiService _apiService;
  // Note: Keep recipe data in memory to avoid unnecessary API calls.
  // The recipes are not expected to change much during one user session
  // (unless specifically updated).
  final Map<int, Recipe> _recipeMap = {};

  RecipeRepository(this._apiService);

  Future<Either<Failure, List<Recipe>>> getAllRecipes() async {
    final query = GetAllRecipesQuery();
    final response = await _apiService.performQuery(query.query);

    return response.match<Either<Failure, List<Recipe>>>(
      (data) {
        if (data == null) {
          return Either.failure(const Failure(noRecipesMessage));
        }
        if (data.isEmpty) return Either.value([]);

        final List<Recipe> recipes = (data[query.name])
            .map<Recipe>((recipe) => Recipe.fromJson(recipe))
            .toList();

        _updateRecipeData(recipes);

        return Either(value: recipes);
      },
      (failure) {
        return Either.failure(failure);
      },
    );
  }

  void _updateRecipeData(List<Recipe> recipes) {
    for (final recipe in recipes) {
      _recipeMap[recipe.id] = recipe;
    }
  }

  void _upsertRecipeData(Recipe recipe) {
    _recipeMap[recipe.id] = recipe;
  }

  Recipe? getRecipeById(int recipeId) {
    return _recipeMap[recipeId];
  }

  List<Recipe> getRecipesByIds(List<int> recipeIds) {
    List<Recipe> pickedRecipes = [];
    for (final recipeId in recipeIds) {
      final recipe = _recipeMap[recipeId];
      if (recipe != null) {
        pickedRecipes.add(recipe);
      }
    }
    return pickedRecipes;
  }

  Future<Either<Failure, Recipe>> createRecipe(CreateRecipeInput input) async {
    final mutation = CreateRecipeMutation(input);

    final response =
        await _apiService.performMutation(mutation.query, mutation.variables!);

    return response.match<Either<Failure, Recipe>>(
      (data) {
        if (data == null || data.isEmpty) {
          return Either.failure(const Failure(noCreatedRecipeMessage));
        }

        final Recipe recipe = Recipe.fromJson((data[mutation.name]));
        _upsertRecipeData(recipe);

        return Either.value(recipe);
      },
      (failure) {
        return Either.failure(failure);
      },
    );
  }
}
