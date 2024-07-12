import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mobile/business_logic/cook_logic/cook_bloc.dart';
import 'package:mobile/business_logic/cook_logic/cook_event.dart';
import 'package:mobile/repositories_and_data/repositories/recipe_repository.dart';
import '../../test_utils/data/all_recipes_test_data.dart';
import '../../test_utils/test_api_service/test_api_service.dart';
import '../../test_utils/custom_matchers/custom_matchers.dart';

final recipes = allTestRecipes;

final recipe1 = recipes[0];
final recipe2 = recipes[1];
final recipe3 = recipes[2];

final recipe1firstIngredient = recipe1.ingredientGroups[0].ingredients[0];
final recipe1secondIngredient = recipe1.ingredientGroups[0].ingredients[1];
final recipe2firstIngredient = recipe2.ingredientGroups[0].ingredients[0];

final recipe1firstInstruction = recipe1.instructionGroups[0].instructions[0];
final recipe1secondInstruction = recipe1.instructionGroups[0].instructions[1];
final recipe2firstInstruction = recipe2.instructionGroups[0].instructions[0];

void main() {
  group('COOK BLOC -', () {
    test('has initial state: all lists and maps empty', () async {
      final recipeRepository = RecipeRepository(testApiService);
      final cookBloc = CookBloc(recipeRepository);
      final state = cookBloc.state;
      final properties = [
        state.isCooking,
        state.pickedRecipeIds,
        state.recipeMap,
        state.ingredientsAddedByRecipe,
        state.instructionsDoneByRecipe,
      ];
      for (final property in properties) {
        expect(property, isEmpty);
      }
    });

    blocTest(
      'adds and removes recipe ids after toggling pick cooking recipe event for different recipes multiple times',
      build: () {
        prepareTestApiServiceForAllRecipesQuery();
        final recipeRepository = RecipeRepository(testApiService);
        recipeRepository.getAllRecipes();
        return CookBloc(recipeRepository);
      },
      act: (bloc) => bloc
        ..add(TogglePickCookingRecipeEvent(recipe1.id))
        ..add(TogglePickCookingRecipeEvent(recipe2.id))
        ..add(TogglePickCookingRecipeEvent(recipe3.id))
        ..add(TogglePickCookingRecipeEvent(recipe2.id)),
      expect: () => [
        HasPickedRecipeIds([recipe1.id]),
        HasPickedRecipeIds([recipe1.id, recipe2.id]),
        HasPickedRecipeIds([recipe1.id, recipe2.id, recipe3.id]),
        HasPickedRecipeIds([recipe1.id, recipe3.id]),
      ],
    );

    // FIXME: Combine the below two tests to use the same act function
    blocTest(
      'adds and removes ingredient ids (under correct recipes) after toggling add ingredient events',
      build: () {
        prepareTestApiServiceForAllRecipesQuery();
        final recipeRepository = RecipeRepository(testApiService);
        recipeRepository.getAllRecipes();
        return CookBloc(recipeRepository);
      },
      act: (bloc) => bloc
        ..add(ToggleIngredientAddedEvent(
            recipeId: recipe1.id, ingredientId: recipe1firstIngredient.id))
        ..add(ToggleIngredientAddedEvent(
          recipeId: recipe1.id,
          ingredientId: recipe1secondIngredient.id,
        ))
        ..add(ToggleIngredientAddedEvent(
          recipeId: recipe2.id,
          ingredientId: recipe2firstIngredient.id,
        ))
        ..add(ToggleIngredientAddedEvent(
          recipeId: recipe1.id,
          ingredientId: recipe1firstIngredient.id,
        )),
      expect: () => [
        HasAddedIngredientIdsByRecipeIds({
          recipe1.id: [recipe1firstIngredient.id]
        }),
        HasAddedIngredientIdsByRecipeIds({
          recipe1.id: [recipe1firstIngredient.id, recipe1secondIngredient.id]
        }),
        HasAddedIngredientIdsByRecipeIds({
          recipe1.id: [recipe1firstIngredient.id, recipe1secondIngredient.id],
          recipe2.id: [recipe2firstIngredient.id]
        }),
        HasAddedIngredientIdsByRecipeIds({
          recipe1.id: [recipe1secondIngredient.id],
          recipe2.id: [recipe2firstIngredient.id]
        }),
      ],
    );

    blocTest(
      'adds and removes ingredient ids (under correct recipes) after toggling add ingredient events',
      build: () {
        prepareTestApiServiceForAllRecipesQuery();
        final recipeRepository = RecipeRepository(testApiService);
        recipeRepository.getAllRecipes();
        return CookBloc(recipeRepository);
      },
      act: (bloc) => bloc
        ..add(ToggleInstructionDoneEvent(
            recipeId: recipe1.id, instructionId: recipe1firstInstruction.id))
        ..add(ToggleInstructionDoneEvent(
          recipeId: recipe1.id,
          instructionId: recipe1secondInstruction.id,
        ))
        ..add(ToggleInstructionDoneEvent(
          recipeId: recipe2.id,
          instructionId: recipe2firstInstruction.id,
        ))
        ..add(ToggleInstructionDoneEvent(
          recipeId: recipe1.id,
          instructionId: recipe1firstInstruction.id,
        )),
      expect: () => [
        HasInstructionsDoneIdsByRecipeIds({
          recipe1.id: [recipe1firstInstruction.id]
        }),
        HasInstructionsDoneIdsByRecipeIds({
          recipe1.id: [recipe1firstInstruction.id, recipe1secondInstruction.id]
        }),
        HasInstructionsDoneIdsByRecipeIds({
          recipe1.id: [recipe1firstInstruction.id, recipe1secondInstruction.id],
          recipe2.id: [recipe2firstInstruction.id]
        }),
        HasInstructionsDoneIdsByRecipeIds({
          recipe1.id: [recipe1secondInstruction.id],
          recipe2.id: [recipe2firstInstruction.id]
        }),
      ],
    );
  });
}
