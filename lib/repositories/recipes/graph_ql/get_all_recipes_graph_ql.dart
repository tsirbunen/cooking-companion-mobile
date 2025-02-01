import 'package:mobile/repositories/recipes/graph_ql/fragments.dart';
import 'package:mobile/repositories/common/graph_ql/graph_ql_query.dart';

class GetAllRecipesQuery extends GraphQLQuery {
  @override
  String get name => 'allRecipes';

  @override
  String get query => '''
    query {
        $name {
          $recipeFragment
        }
    }
    ''';
}
