import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/business_logic/cook_logic/cook_event.dart';
import 'package:mobile/business_logic/cook_logic/cook_state.dart';
import 'package:mobile/business_logic/models/side/side_enum.dart';
import 'package:mobile/business_logic/cook_logic/utils.dart';
import 'package:mobile/business_logic/models/recipe/recipe.dart';
import 'package:mobile/repositories/recipes/repositories/recipe_repository.dart';

class CookBloc extends Bloc<CookEvent, CookState> {
  final RecipeRepository _recipeRepository;

  CookBloc(this._recipeRepository)
      : super(const CookState(
          isCooking: [],
          pickedRecipeIds: [],
          recipeMap: {},
          ingredientsAddedByRecipe: {},
          instructionsDoneByRecipe: {},
        )) {
    on<CookEvent>(_onEvent);
  }

  Future<void> _onEvent(CookEvent event, Emitter<CookState> emit) async {
    return switch (event) {
      final TogglePickCookingRecipeEvent e =>
        _onTogglePickCookingRecipeEvent(e, emit),
      final ToggleCookRecipeEvent e => _onToggleCookRecipeEvent(e, emit),
      final ToggleIngredientAddedEvent e =>
        _onToggleIngredientAddedEvent(e, emit),
      final ToggleInstructionDoneEvent e =>
        _onToggleInstructionDoneEvent(e, emit),
      final CookEvent _ => emit(state),
    };
  }

  void _onToggleIngredientAddedEvent(
    ToggleIngredientAddedEvent event,
    Emitter<CookState> emit,
  ) {
    final recipeId = event.recipeId;
    final ingredientId = event.ingredientId;

    final newIngredientsAddedByRecipe = toggleRecipeListItem(
        state.ingredientsAddedByRecipe, recipeId, ingredientId);

    emit(state.copyWith(
        newIngredientsAddedByRecipe: newIngredientsAddedByRecipe));
  }

  void _onToggleInstructionDoneEvent(
    ToggleInstructionDoneEvent event,
    Emitter<CookState> emit,
  ) {
    final recipeId = event.recipeId;
    final instructionId = event.instructionId;

    final newInstructionsDoneByRecipe = toggleRecipeListItem(
        state.instructionsDoneByRecipe, recipeId, instructionId);

    emit(state.copyWith(
        newInstructionsDoneByRecipe: newInstructionsDoneByRecipe));
  }

  void _onToggleCookRecipeEvent(
    ToggleCookRecipeEvent event,
    Emitter<CookState> emit,
  ) {
    final recipeId = event.recipeId;
    final previousIsCooking = state.isCooking.contains(recipeId);
    List<int> newIsCooking = previousIsCooking
        ? state.isCooking.where((id) => id != recipeId).toList()
        : [...state.isCooking, recipeId];

    emit(state.copyWith(newIsCooking: newIsCooking));
  }

  void _onTogglePickCookingRecipeEvent(
    TogglePickCookingRecipeEvent event,
    Emitter<CookState> emit,
  ) {
    final recipeId = event.recipeId;
    final recipe = _recipeRepository.getRecipeById(recipeId);
    if (recipe == null) return;

    List<int> newPickedIds;
    Map<int, Recipe>? newRecipeMap;
    if (state.pickedRecipeIds.contains(recipeId)) {
      // FIXME: Should we delete recipe data or not?
      newPickedIds =
          state.pickedRecipeIds.where((id) => id != recipeId).toList();
    } else {
      newPickedIds = [...state.pickedRecipeIds, recipeId];
      if (!state.recipeMap.containsKey(recipeId)) {
        newRecipeMap = {...state.recipeMap};
        newRecipeMap[recipeId] = recipe;
      }
    }

    emit(state.copyWith(
      newPickedRecipeIds: newPickedIds,
      newRecipeMap: newRecipeMap,
    ));
  }

  Recipe? getRecipe(int recipeId) {
    return _recipeRepository.getRecipeById(recipeId);
  }

  int? getFocusRecipeId() {
    if (state.pickedRecipeIds.isEmpty) return null;
    return state.pickedRecipeIds.first;
  }

  int? getRecipeOnSideId(Side side, int currentId) {
    final ids = state.pickedRecipeIds;
    if (ids.length < 2) return null;
    final currentIndex = ids.indexOf(currentId);
    if (currentIndex == -1) return null;

    final nextIndex = side == Side.left
        ? _getIndexOnLeft(ids, currentIndex)
        : _getIndexOnRight(ids, currentIndex);

    return ids[nextIndex];
  }

  int _getIndexOnRight<T>(List<T> items, int currentIndex) {
    return currentIndex >= items.length - 1 ? 0 : currentIndex + 1;
  }

  int _getIndexOnLeft<T>(List<T> items, int currentIndex) {
    return currentIndex == 0 ? items.length - 1 : currentIndex - 1;
  }
}
