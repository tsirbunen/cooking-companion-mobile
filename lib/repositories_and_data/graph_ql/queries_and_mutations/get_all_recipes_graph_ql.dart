import 'package:mobile/repositories_and_data/graph_ql/fragments/fragments.dart';
import 'package:mobile/repositories_and_data/graph_ql/models/graph_ql_query.dart';

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
