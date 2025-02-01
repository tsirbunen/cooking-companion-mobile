import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/business_logic/all_recipes_logic/all_recipes_event.dart';
import 'package:mobile/business_logic/all_recipes_logic/all_recipes_state.dart';
import 'package:mobile/business_logic/models/bloc_status/bloc_status.dart';
import 'package:mobile/repositories/recipes/repositories/recipe_repository.dart';
import 'package:mobile/business_logic/models/recipe/recipe.dart';
import 'package:mobile/repositories/common/models/either/either.dart';
import 'package:mobile/repositories/common/models/failure/failure.dart';

class AllRecipesBloc extends Bloc<AllRecipesEvent, AllRecipesState> {
  final RecipeRepository _recipeRepository;

  AllRecipesBloc(this._recipeRepository) : super(const AllRecipesState()) {
    on<AllRecipesEvent>(_onEvent);
  }

  Future<void> _onEvent(
      AllRecipesEvent event, Emitter<AllRecipesState> emit) async {
    return switch (event) {
      final FetchAllRecipesEvent e => _onFetchAllRecipesEvent(e, emit),
      final RecipeUpdateEvent e => _onRecipeUpdateEvent(e, emit),
      final AllRecipesEvent _ => emit(state),
    };
  }

  void _onFetchAllRecipesEvent(
    FetchAllRecipesEvent event,
    Emitter<AllRecipesState> emit,
  ) async {
    emit(state.copyWith(newStatus: Status.loading));

    final Either<Failure, List<Recipe>> result =
        await _recipeRepository.getAllRecipes();
    result.match(
      (data) => emit(state.copyWith(
        newAllRecipes: data,
        newStatus: Status.ok,
        newInitialLoadingDone: true,
      )),
      (failure) => emit(state.copyWith(newStatus: Status.error)),
    );
  }

  void _onRecipeUpdateEvent(
    RecipeUpdateEvent event,
    Emitter<AllRecipesState> emit,
  ) async {
    final recipeId = event.recipeId;
    final recipe = event.recipe;
    final recipeWasDeleted = recipe == null;
    if (recipeWasDeleted) {
      final updatedRecipes =
          state.recipes.where((r) => r.id != recipeId).toList();
      emit(state.copyWith(newAllRecipes: updatedRecipes));
    } else {
      bool updateDone = false;
      final updatedRecipes = state.recipes.map((originalRecipe) {
        bool isCurrentRecipe = originalRecipe.id == recipeId;
        if (isCurrentRecipe) {
          updateDone = true;
          return recipe;
        }
        return originalRecipe;
      }).toList();
      if (updateDone) {
        return emit(state.copyWith(newAllRecipes: updatedRecipes));
      }

      updatedRecipes.add(recipe);
      emit(state.copyWith(newAllRecipes: updatedRecipes));
    }
  }
}
