Map<int, List<int>> toggleRecipeListItem(
  Map<int, List<int>> previousItems,
  int recipeId,
  int itemId,
) {
  final previousRecipeItems = previousItems[recipeId] ?? [];
  final bool shouldRemove = previousRecipeItems.contains(itemId);
  List<int> newRecipeItems = shouldRemove
      ? previousRecipeItems.where((id) => id != itemId).toList()
      : [...previousRecipeItems, itemId];

  final newItemsByRecipe = {...previousItems};
  newItemsByRecipe[recipeId] = newRecipeItems;

  return newItemsByRecipe;
}
