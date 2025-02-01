import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/business_logic/models/recipe/recipe.dart';
import 'package:mobile/presentation/pages/search/recipe_display_mode_enum.dart';
import 'package:mobile/business_logic/search_logic/search_event.dart';
import 'package:mobile/business_logic/search_logic/search_state.dart';
import 'package:mobile/repositories/recipes/repositories/recipe_repository.dart';
import 'package:mobile/business_logic/models/bloc_status/bloc_status.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final RecipeRepository _recipeRepository;

  SearchBloc(this._recipeRepository)
      : super(const SearchState(status: Status.ok)) {
    on<SearchEvent>(_onEvent);
  }

  Future<void> _onEvent(SearchEvent event, Emitter<SearchState> emit) async {
    return switch (event) {
      final TogglePickSearchRecipeEvent e =>
        _onTogglePickedRecipeEvent(e, emit),
      final ToggleDisplayModeEvent e => _onToggleDisplayModeEvent(e, emit),
      final SearchEvent _ => emit(state),
    };
  }

  void _onToggleDisplayModeEvent(
    ToggleDisplayModeEvent event,
    Emitter<SearchState> emit,
  ) {
    emit(state.copyWith(
      newDisplayMode: state.displayMode == RecipeDisplayMode.card
          ? RecipeDisplayMode.title
          : RecipeDisplayMode.card,
    ));
  }

  Future<void> _onTogglePickedRecipeEvent(
    TogglePickSearchRecipeEvent event,
    Emitter<SearchState> emit,
  ) async {
    final recipe = event.recipe;
    final bool shouldRemove = state.pickedRecipeIds.contains(recipe.id);
    List<int> newPickedRecipeIds = shouldRemove
        ? state.pickedRecipeIds.where((id) => id != recipe.id).toList()
        : [...state.pickedRecipeIds, recipe.id];

    emit(state.copyWith(newPickedRecipeIds: newPickedRecipeIds));
  }

  List<Recipe> getPickedRecipes() {
    return _recipeRepository.getRecipesByIds(state.pickedRecipeIds);
  }
}
