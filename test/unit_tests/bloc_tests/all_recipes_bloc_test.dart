import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mobile/business_logic/all_recipes_logic/all_recipes_bloc.dart';
import 'package:mobile/business_logic/all_recipes_logic/all_recipes_event.dart';
import 'package:mobile/business_logic/all_recipes_logic/all_recipes_state.dart';
import 'package:mobile/business_logic/models/bloc_status/bloc_status.dart';
import 'package:mobile/business_logic/models/recipe/recipe.dart';
import 'package:mobile/repositories_and_data/graph_ql/queries_and_mutations/get_all_recipes_graph_ql.dart';
import 'package:mobile/repositories_and_data/repositories/recipe_repository.dart';
import '../../test_utils/custom_matchers/custom_matchers.dart';
import '../../test_utils/data/all_recipes_test_data.dart';
import '../../test_utils/test_api_service/test_api_service.dart';

void main() {
  group('ALL RECIPES BLOC -', () {
    test('has initial state: initial loading done false, no recipes, status ok',
        () async {
      final recipeRepository = RecipeRepository(testApiService);
      final allRecipesBloc = AllRecipesBloc(recipeRepository);
      final state = allRecipesBloc.state;
      expect(state.initialLoadingDone, false);
      expect(state.recipes.length, 0);
      expect(state.status, BlocStatus.ok);
    });

    blocTest(
      'emits state with status loading when starts fetching recipes and ok once completed',
      build: () {
        prepareTestApiServiceForAllRecipesQuery();
        final recipeRepository = RecipeRepository(testApiService);
        return AllRecipesBloc(recipeRepository);
      },
      act: (bloc) => bloc.add(FetchAllRecipesEvent()),
      expect: () => [
        HasStatus(BlocStatus.loading),
        HasStatus(BlocStatus.ok),
      ],
    );

    blocTest(
      'fetches all recipes on event',
      build: () {
        prepareTestApiServiceForAllRecipesQuery();
        final recipeRepository = RecipeRepository(testApiService);
        return AllRecipesBloc(recipeRepository);
      },
      act: (bloc) => bloc.add(FetchAllRecipesEvent()),
      skip: 1,
      expect: () => [isA<AllRecipesState>()],
      verify: (bloc) {
        final query = GetAllRecipesQuery();
        final recipes = bloc.state.recipes;
        expect(recipes.length, allRecipesTestData[query.name]!.length);
        for (final recipe in recipes) {
          expect(recipe, isA<Recipe>());
        }
      },
    );
  });
}
