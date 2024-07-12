import 'package:mobile/repositories_and_data/models/create_recipe_input/create_recipe_input.dart';
import 'package:mobile/repositories_and_data/graph_ql/fragments/fragments.dart';
import 'package:mobile/repositories_and_data/graph_ql/models/graph_ql_mutation.dart';

class CreateRecipeMutation extends GraphQLMutation {
  final CreateRecipeInput input;

  CreateRecipeMutation(this.input) : super();

  @override
  String get name => 'createRecipe';

  @override
  String get query => '''
        mutation CreateRecipe(\$recipeInput: RecipeInput!) {
            $name(recipeInput: \$recipeInput) {
              $recipeFragment
            }
        }
    ''';

  @override
  Map<String, dynamic>? get variables => {'recipeInput': input.toJson()};
}
