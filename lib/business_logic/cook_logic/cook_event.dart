class CookEvent {}

class TogglePickCookingRecipeEvent extends CookEvent {
  final int recipeId;

  TogglePickCookingRecipeEvent(this.recipeId);
}

class ToggleCookRecipeEvent extends CookEvent {
  final int recipeId;

  ToggleCookRecipeEvent(this.recipeId);
}

class ToggleIngredientAddedEvent extends CookEvent {
  final int recipeId;
  final int ingredientId;

  ToggleIngredientAddedEvent({
    required this.recipeId,
    required this.ingredientId,
  });
}

class ToggleInstructionDoneEvent extends CookEvent {
  final int recipeId;
  final int instructionId;

  ToggleInstructionDoneEvent({
    required this.recipeId,
    required this.instructionId,
  });
}

class SetRecipeScrollPositionEvent extends CookEvent {
  final int recipeId;
  final double position;

  SetRecipeScrollPositionEvent({
    required this.recipeId,
    required this.position,
  });
}
