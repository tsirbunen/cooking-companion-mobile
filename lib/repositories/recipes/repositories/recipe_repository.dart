import 'package:mobile/app_services/api_service/api_service.dart';
import 'package:mobile/business_logic/models/recipe/recipe.dart';
import 'package:mobile/repositories/recipes/graph_ql/create_recipe_graph_ql.dart';
import 'package:mobile/repositories/recipes/graph_ql/get_all_recipes_graph_ql.dart';
import 'package:mobile/repositories/recipes/graph_ql/patch_recipe_graph_ql.dart';
import 'package:mobile/repositories/recipes/models/create_recipe_input/create_recipe_input.dart';
import 'package:mobile/repositories/common/models/either/either.dart';
import 'package:mobile/repositories/common/models/failure/failure.dart';
import 'package:mobile/repositories/recipes/models/patch_recipe_input/patch_recipe_input.dart';

const noCreatedRecipeMessage = 'Failed to create recipe!';
const noRecipesMessage = 'Failed to get any recipe data!';
const noPatchedRecipeMessage = 'Failed to patch recipe!';

class RecipeRepository {
  final ApiService _apiService;
  // Note: Keep recipe data in memory to avoid unnecessary API calls.
  // The recipes are not expected to change much during one user session
  // (unless specifically updated).
  final Map<int, Recipe> _recipeMap = {};

  RecipeRepository(this._apiService);

  Future<Either<Failure, List<Recipe>>> getAllRecipes() async {
    final query = GetAllRecipesQuery();
    final response =
        await _apiService.performQuery(query.query, query.variables);

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

  Future<Either<Failure, Recipe>> patchRecipe(PatchRecipeInput input) async {
    final mutation = PatchRecipeMutation(input);

    final response =
        await _apiService.performMutation(mutation.query, mutation.variables!);

    return response.match<Either<Failure, Recipe>>(
      (data) {
        if (data == null || data.isEmpty) {
          return Either.failure(const Failure(noPatchedRecipeMessage));
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
