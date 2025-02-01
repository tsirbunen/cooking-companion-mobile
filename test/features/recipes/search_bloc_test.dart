import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mobile/business_logic/models/bloc_status/bloc_status.dart';
import 'package:mobile/business_logic/search_logic/search_bloc.dart';
import 'package:mobile/business_logic/search_logic/search_event.dart';
import 'package:mobile/business_logic/search_logic/search_state.dart';
import 'package:mobile/presentation/pages/search/recipe_display_mode_enum.dart';
import 'package:mobile/repositories/recipes/repositories/recipe_repository.dart';
import 'all_recipes_test_data.dart';
import '../../utils/test_api_service.dart';
import '../../utils/custom_matchers.dart';

final recipes = allTestRecipes;
final testRecipe1 = recipes[0];
final testRecipe2 = recipes[1];
final testRecipe3 = recipes[2];

void main() {
  group('SEARCH BLOC -', () {
    test('has initial state: display mode card, no picked recipes, status ok',
        () async {
      final recipeRepository = RecipeRepository(testApiService);
      final searchBloc = SearchBloc(recipeRepository);
      final state = searchBloc.state;
      expect(state.displayMode, RecipeDisplayMode.card);
      expect(state.pickedRecipeIds.length, 0);
      expect(state.status, Status.ok);
    });

    blocTest(
      'emits state with display mode title after toggling display mode once',
      build: () {
        final recipeRepository = RecipeRepository(testApiService);
        return SearchBloc(recipeRepository);
      },
      act: (bloc) => bloc.add(ToggleDisplayModeEvent()),
      expect: () => [isA<SearchState>()],
      verify: (bloc) => expect(bloc.state.displayMode, RecipeDisplayMode.title),
    );

    blocTest(
      'emits state with display mode card after toggling display mode twice',
      build: () {
        final recipeRepository = RecipeRepository(testApiService);
        return SearchBloc(recipeRepository);
      },
      act: (bloc) => bloc
        ..add(ToggleDisplayModeEvent())
        ..add(ToggleDisplayModeEvent()),
      skip: 1,
      verify: (bloc) => expect(bloc.state.displayMode, RecipeDisplayMode.card),
    );

    blocTest(
      'emits state with recipe id added to picked recipe ids after a pick recipe event',
      build: () {
        final recipeRepository = RecipeRepository(testApiService);
        return SearchBloc(recipeRepository);
      },
      act: (bloc) => bloc.add(TogglePickSearchRecipeEvent(testRecipe1)),
      expect: () => [isA<SearchState>()],
      verify: (bloc) => expect(bloc.state.pickedRecipeIds[0], testRecipe1.id),
    );

    blocTest(
      'emits states with recipe id and no recipe id if pick same recipe is toggled twice',
      build: () {
        final recipeRepository = RecipeRepository(testApiService);
        return SearchBloc(recipeRepository);
      },
      act: (bloc) => bloc
        ..add(TogglePickSearchRecipeEvent(testRecipe1))
        ..add(TogglePickSearchRecipeEvent(testRecipe1)),
      expect: () => [
        HasPickedRecipeIds([testRecipe1.id]),
        HasPickedRecipeIds([]),
      ],
    );

    blocTest(
      'adds and removes recipe ids after toggling pick recipe event for different recipes multiple times',
      build: () {
        final recipeRepository = RecipeRepository(testApiService);
        return SearchBloc(recipeRepository);
      },
      act: (bloc) => bloc
        ..add(TogglePickSearchRecipeEvent(testRecipe1))
        ..add(TogglePickSearchRecipeEvent(testRecipe2))
        ..add(TogglePickSearchRecipeEvent(testRecipe3))
        ..add(TogglePickSearchRecipeEvent(testRecipe2)),
      expect: () => [
        HasPickedRecipeIds([testRecipe1.id]),
        HasPickedRecipeIds([testRecipe1.id, testRecipe2.id]),
        HasPickedRecipeIds([testRecipe1.id, testRecipe2.id, testRecipe3.id]),
        HasPickedRecipeIds([testRecipe1.id, testRecipe3.id]),
      ],
    );
  });
}
