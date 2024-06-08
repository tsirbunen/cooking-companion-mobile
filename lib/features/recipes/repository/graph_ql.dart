import 'package:mobile/utils/graph_ql/fragments.dart';
import 'package:mobile/utils/graph_ql/graph_ql_query.dart';

class InitialRecipesQuery extends GraphQLQuery {
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
