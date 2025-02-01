import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/business_logic/account_logic/account_state.dart';
import 'package:mobile/business_logic/account_logic/helper_models.dart';
import 'package:mobile/business_logic/cook_logic/cook_state.dart';
import 'package:mobile/business_logic/models/bloc_status/bloc_status.dart';
import 'package:mobile/repositories/recipes/graph_ql/get_all_validation_schemas.dart';

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
  HasStatus(Status status)
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

class HasCorrectAccountState extends Matcher {
  final Map<String, dynamic> params;
  const HasCorrectAccountState(this.params);

  @override
  bool matches(Object? item, Map matchState) {
    final state = item as AccountState;
    final stateProperties = {
      'status': state.status.status,
      'username': state.username,
      'email': state.email,
      'password': state.password,
      'passwordConfirm': state.passwordConfirm,
      'currentAccount': state.currentAccount,
    };

    for (final entry in stateProperties.entries) {
      final property = entry.key;
      final value = entry.value;

      if (params.containsKey(property)) {
        expect(value, equals(params[property]));
      }
    }

    return true;
  }

  @override
  Description describe(Description description) {
    return description.add('State contains correct account parameters');
  }
}

final validationTargetFields = {
  ValidationTarget.EMAIL_ACCOUNT_INPUT: [
    Field.username,
    Field.email,
    Field.password,
    Field.passwordConfirm,
  ],
  ValidationTarget.SIGN_IN_TO_EMAIL_ACCOUNT_INPUT: [
    Field.email,
    Field.password,
  ],
  ValidationTarget.REQUEST_VERIFICATION_EMAIL_INPUT: [Field.email],
};

class CheckIfHasValidatorFns extends Matcher {
  final bool hasFunctions;
  final List<ValidationTarget> targets;
  const CheckIfHasValidatorFns(this.hasFunctions, this.targets);

  @override
  bool matches(Object? item, Map matchState) {
    final state = item as AccountState;

    for (final target in targets) {
      final validators = state.validationFnsByTarget[target];
      if (hasFunctions) {
        expect(validators, isNotNull);
        final entries = validationTargetFields[target];
        expect(entries, isNotNull);

        for (final entry in entries!) {
          if (hasFunctions) {
            final validatorFn = validators![entry];
            expect(validatorFn, isNotNull);
          } else {
            expect(validators![entry], isNull);
          }
        }
      } else {
        expect(validators, isNull);
      }
    }

    return true;
  }

  @override
  Description describe(Description description) {
    return description.add('State contains correct account parameters');
  }
}
