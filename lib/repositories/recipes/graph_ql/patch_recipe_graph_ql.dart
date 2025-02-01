import 'package:mobile/repositories/recipes/graph_ql/fragments.dart';
import 'package:mobile/repositories/common/graph_ql/graph_ql_mutation.dart';
import 'package:mobile/repositories/recipes/models/patch_recipe_input/patch_recipe_input.dart';

class PatchRecipeMutation extends GraphQLMutation {
  final PatchRecipeInput input;

  PatchRecipeMutation(this.input) : super();

  @override
  String get name => 'patchRecipe';

  @override
  String get query => '''
        mutation PatchRecipe(\$recipeId: Int!, \$recipePatch: RecipeInput!) {
            $name(recipeId: \$recipeId, recipePatch: \$recipePatch) {
              $recipeFragment
            }
        }
    ''';

  @override
  Map<String, dynamic>? get variables => {
        'recipeId': input.recipeId,
        'recipePatch': getVariablesToInclude(),
      };

  Map<String, dynamic> getVariablesToInclude() {
    Map<String, dynamic> inputMap = input.toJson();
    Map<String, dynamic> variables = {};

    for (var key in inputMap.keys) {
      if (input.fieldsToInclude.contains(key)) {
        variables[key] = inputMap[key];
      }
    }

    return variables;
  }
}
