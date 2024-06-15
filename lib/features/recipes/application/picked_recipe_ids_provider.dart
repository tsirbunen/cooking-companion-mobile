import 'package:flutter_riverpod/flutter_riverpod.dart';

final pickedRecipesProvider =
    NotifierProvider.autoDispose<PickedRecipesController, List<int>>(
        PickedRecipesController.new);

class PickedRecipesController extends AutoDisposeNotifier<List<int>> {
  @override
  List<int> build() {
    return [];
  }

  void togglePickRecipe(int recipeId) {
    if (state.contains(recipeId)) {
      // Note: We have to specifically set the "state" to a new value
      // with "state = ..." because that is the event that triggers
      // the UI rebuilds!
      state = state.where((id) => id != recipeId).toList();
    } else {
      state = [...state, recipeId];
    }
  }
}
