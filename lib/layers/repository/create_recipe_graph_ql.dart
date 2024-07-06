import 'package:mobile/utils/graph_ql/fragments.dart';
import 'package:mobile/utils/graph_ql/graph_ql_query.dart';

class CreateRecipeMutation extends GraphQLQuery {
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
}
