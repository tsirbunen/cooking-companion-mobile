import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/business_logic/models/recipe/recipe.dart';
import 'package:mobile/repositories/recipes/graph_ql/get_all_recipes_graph_ql.dart';
import 'package:mobile/repositories/recipes/repositories/recipe_repository.dart';
import 'create_recipe_test_data.dart';
import 'all_recipes_test_data.dart';
import '../../utils/test_api_service.dart';

void main() {
  group('RECIPE REPOSITORY -', () {
    test('fetches recipes and converts them to model objects', () async {
      final query = GetAllRecipesQuery();
      prepareTestApiServiceForAllRecipesQuery();
      final recipeRepository = RecipeRepository(testApiService);
      final response = await recipeRepository.getAllRecipes();
      final recipes = response.valueOrNull;
      expect(recipes!.length, allRecipesTestData[query.name]!.length);
      for (final recipe in recipes) {
        expect(recipe, isA<Recipe>());
      }
    });

    test('returns a failure on api client exception', () async {
      prepareTestApiServiceForAllRecipesQueryFailure();
      final recipeRepository = RecipeRepository(testApiService);
      final response = await recipeRepository.getAllRecipes();
      expect(response.isFailure, true);
    });

    test('stores fetched recipes and returns them when queried', () async {
      prepareTestApiServiceForAllRecipesQuery();
      final recipeRepository = RecipeRepository(testApiService);
      await recipeRepository.getAllRecipes();
      final firstRecipeId = firstTestRecipeJson['id'] as int;
      final recipe = recipeRepository.getRecipeById(firstRecipeId);
      expect(recipe, isA<Recipe>());
      expect(recipe!.id, firstRecipeId);
      expect(recipe.title, firstTestRecipeJson['title']);
      final secondRecipeId = secondTestRecipeJson['id'] as int;
      final recipes =
          recipeRepository.getRecipesByIds([firstRecipeId, secondRecipeId]);
      expect(recipes.length, 2);
      final allRecipes = recipeRepository.getRecipesByIds(allRecipeIds);
      expect(allRecipes.length, allRecipeIds.length);
    });

    test('creates a new recipe and stores it', () async {
      prepareTestApiServiceForCreateRecipeMutation();
      final recipeRepository = RecipeRepository(testApiService);
      final response =
          await recipeRepository.createRecipe(createRecipeTestInput);
      final recipe = response.valueOrNull;
      final expectedId = createRecipeTestData['createRecipe']!['id'] as int;
      final expectedTitle = createRecipeTestData['createRecipe']!['title'];
      expect(recipe, isA<Recipe>());
      expect(recipe!.id, expectedId);
      expect(recipe.title, expectedTitle);
      final recipeLater = recipeRepository.getRecipeById(expectedId);
      expect(recipeLater, isA<Recipe>());
      expect(recipeLater!.id, expectedId);
      expect(recipeLater.title, expectedTitle);
    });

    test('adds newly created recipe to earlier fetched recipes', () async {
      prepareTestApiServiceForAllRecipesQuery();
      final recipeRepository = RecipeRepository(testApiService);
      await recipeRepository.getAllRecipes();
      prepareTestApiServiceForCreateRecipeMutation();
      await recipeRepository.createRecipe(createRecipeTestInput);
      final expectedNewId = createRecipeTestData['createRecipe']!['id'] as int;
      final recipeIds = [...allRecipeIds, expectedNewId];
      final allEarlierRecipesAndNew =
          recipeRepository.getRecipesByIds(recipeIds);
      expect(allEarlierRecipesAndNew.length, allRecipeIds.length + 1);
    });
  });
}
