import 'package:mobile/business_logic/models/recipe/recipe.dart';

class SearchEvent {}

class TogglePickSearchRecipeEvent extends SearchEvent {
  final Recipe recipe;

  TogglePickSearchRecipeEvent(this.recipe);
}

class ToggleDisplayModeEvent extends SearchEvent {}
