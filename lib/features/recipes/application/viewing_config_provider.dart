import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/features/recipes/presentation/search_recipes/recipe_display/display/recipe_display_mode_enum.dart';

class ViewingConfig {
  final bool showPickedRecipes;
  final bool showSingleColumn;
  final RecipeDisplayMode displayMode;

  ViewingConfig({
    required this.showPickedRecipes,
    required this.showSingleColumn,
    required this.displayMode,
  });

  ViewingConfig copyWith({
    bool? showPickedRecipes,
    bool? showSingleColumn,
    RecipeDisplayMode? recipeDisplayMode,
  }) {
    return ViewingConfig(
      showPickedRecipes: showPickedRecipes ?? this.showPickedRecipes,
      showSingleColumn: showSingleColumn ?? this.showSingleColumn,
      displayMode: recipeDisplayMode ?? displayMode,
    );
  }
}

final viewingConfigProvider =
    NotifierProvider.autoDispose<ViewingConfigController, ViewingConfig>(
        ViewingConfigController.new);

class ViewingConfigController extends AutoDisposeNotifier<ViewingConfig> {
  @override
  ViewingConfig build() {
    return ViewingConfig(
      showPickedRecipes: false,
      showSingleColumn: false,
      displayMode: RecipeDisplayMode.card,
    );
  }

  void toggleShowPickedRecipes() {
    state = state.copyWith(showPickedRecipes: !state.showPickedRecipes);
  }

  void toggleColumnsShownCount() {
    state = state.copyWith(showSingleColumn: !state.showSingleColumn);
  }

  void toggleRecipeDisplayMode() {
    final nextMode = state.displayMode == RecipeDisplayMode.card
        ? RecipeDisplayMode.title
        : RecipeDisplayMode.card;

    state = state.copyWith(recipeDisplayMode: nextMode);
  }
}
