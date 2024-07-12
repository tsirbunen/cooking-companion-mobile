import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/business_logic/all_recipes_logic/all_recipes_event.dart';
import 'package:mobile/business_logic/all_recipes_logic/all_recipes_state.dart';
import 'package:mobile/business_logic/models/bloc_status/bloc_status.dart';
import 'package:mobile/repositories_and_data/repositories/recipe_repository.dart';
import 'package:mobile/business_logic/models/recipe/recipe.dart';
import 'package:mobile/repositories_and_data/models/either/either.dart';
import 'package:mobile/repositories_and_data/models/failure/failure.dart';

class AllRecipesBloc extends Bloc<AllRecipesEvent, AllRecipesState> {
  final RecipeRepository _recipeRepository;

  AllRecipesBloc(this._recipeRepository) : super(const AllRecipesState()) {
    on<AllRecipesEvent>(_onEvent);
  }

  Future<void> _onEvent(
      AllRecipesEvent event, Emitter<AllRecipesState> emit) async {
    return switch (event) {
      final FetchAllRecipesEvent e => _onFetchAllRecipesEvent(e, emit),
      final AllRecipesEvent _ => emit(state),
    };
  }

  void _onFetchAllRecipesEvent(
    FetchAllRecipesEvent event,
    Emitter<AllRecipesState> emit,
  ) async {
    emit(state.copyWith(newStatus: BlocStatus.loading));

    final Either<Failure, List<Recipe>> result =
        await _recipeRepository.getAllRecipes();
    result.match(
      (data) => emit(state.copyWith(
        newAllRecipes: data,
        newStatus: BlocStatus.ok,
        newInitialLoadingDone: true,
      )),
      (failure) => emit(state.copyWith(newStatus: BlocStatus.error)),
    );
  }
}
