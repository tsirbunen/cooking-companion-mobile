import 'package:mobile/business_logic/models/recipe/recipe.dart';

class AllRecipesEvent {}

class FetchAllRecipesEvent extends AllRecipesEvent {}

class RecipeUpdateEvent extends AllRecipesEvent {
  final int recipeId;
  final Recipe? recipe;

  RecipeUpdateEvent({required this.recipeId, this.recipe});
}
