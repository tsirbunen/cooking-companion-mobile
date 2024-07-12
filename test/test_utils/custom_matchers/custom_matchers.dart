import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/business_logic/cook_logic/cook_state.dart';
import 'package:mobile/business_logic/models/bloc_status/bloc_status.dart';

// Note: These custom matchers are designed to pick specific fields from blocs
// and then perform the match with a given matcher. When looking for suitable
// matchers (like equals, isA, isTrue, ...) go to:
// https://pub.dev/documentation/matcher/latest/matcher/matcher-library.html

class HasPickedRecipeIds extends CustomMatcher {
  HasPickedRecipeIds(List<int> recipeIdsInOrder)
      : super(
          "State with pickedRecipeIds that is",
          "pickedRecipeIds",
          recipeIdsInOrder.isEmpty
              ? isEmpty
              : containsAllInOrder(recipeIdsInOrder),
        );

  @override
  featureValueOf(bloc) => bloc.pickedRecipeIds;
}

class HasStatus extends CustomMatcher {
  HasStatus(BlocStatus status)
      : super(
          "Bloc has status",
          "status",
          equals(status),
        );

  @override
  featureValueOf(bloc) => bloc.status;
}

class HasAddedIngredientIdsByRecipeIds extends Matcher {
  final Map<int, List<int>> ingredientIdsByRecipeIdExpected;
  const HasAddedIngredientIdsByRecipeIds(this.ingredientIdsByRecipeIdExpected);

  @override
  bool matches(Object? item, Map matchState) {
    final cookState = item as CookState;
    final ingredientsAdded = cookState.ingredientsAddedByRecipe;
    validateIdListsByIdMap(ingredientIdsByRecipeIdExpected, ingredientsAdded);
    return true;
  }

  @override
  Description describe(Description description) {
    return description.add('Ingredient ids correctly arranged by recipe ids');
  }
}

class HasInstructionsDoneIdsByRecipeIds extends Matcher {
  final Map<int, List<int>> instructionIdsByRecipeIdExpected;
  const HasInstructionsDoneIdsByRecipeIds(
      this.instructionIdsByRecipeIdExpected);

  @override
  bool matches(Object? item, Map matchState) {
    final cookState = item as CookState;
    final instructionsAdded = cookState.instructionsDoneByRecipe;
    validateIdListsByIdMap(instructionIdsByRecipeIdExpected, instructionsAdded);
    return true;
  }

  @override
  Description describe(Description description) {
    return description.add('Instruction ids correctly arranged by recipe ids');
  }
}

validateIdListsByIdMap(
  Map<int, List<int>> itemIdsByRecipeIdExpected,
  Map<int, List<int>> itemIdsByRecipeIdActual,
) {
  for (final recipeId in itemIdsByRecipeIdExpected.keys) {
    final expectedIds = itemIdsByRecipeIdExpected[recipeId]!;
    final actualIds = itemIdsByRecipeIdActual[recipeId]!;
    expect(actualIds, containsAllInOrder(expectedIds));
  }
  expect(
    itemIdsByRecipeIdActual.keys.length,
    equals(itemIdsByRecipeIdExpected.keys.length),
  );
}
