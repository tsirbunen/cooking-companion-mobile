import 'package:equatable/equatable.dart';
import 'package:mobile/presentation/pages/search/recipe_display_mode_enum.dart';
import 'package:mobile/business_logic/models/bloc_status/bloc_status.dart';

class SearchState extends Equatable {
  final BlocStatus status;
  final List<int> pickedRecipeIds;
  final RecipeDisplayMode displayMode;

  const SearchState({
    required this.status,
    this.pickedRecipeIds = const [],
    this.displayMode = RecipeDisplayMode.card,
  });

  SearchState copyWith({
    BlocStatus? newStatus,
    List<int>? newPickedRecipeIds,
    RecipeDisplayMode? newDisplayMode,
  }) {
    return SearchState(
      status: newStatus ?? status,
      pickedRecipeIds: newPickedRecipeIds ?? pickedRecipeIds,
      displayMode: newDisplayMode ?? displayMode,
    );
  }

  @override
  List<Object?> get props => [
        status,
        pickedRecipeIds,
        displayMode,
      ];
}
