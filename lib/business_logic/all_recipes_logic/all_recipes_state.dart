import 'package:mobile/business_logic/models/bloc_status/bloc_status.dart';
import 'package:mobile/business_logic/models/recipe/recipe.dart';

class AllRecipesState {
  final List<Recipe> recipes;
  final BlocStatus status;
  final bool initialLoadingDone;

  const AllRecipesState({
    this.recipes = const [],
    this.status = BlocStatus.ok,
    this.initialLoadingDone = false,
  });

  AllRecipesState copyWith({
    List<Recipe>? newAllRecipes,
    BlocStatus? newStatus,
    bool? newInitialLoadingDone,
  }) {
    return AllRecipesState(
      status: newStatus ?? status,
      recipes: newAllRecipes ?? recipes,
      initialLoadingDone: newInitialLoadingDone ?? initialLoadingDone,
    );
  }
}
