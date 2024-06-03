import 'package:mobile/utils/graph_ql/graphql_queries.dart';

const queryName = 'allRecipes';

const getInitialRecipesQuery = '''
query {
    $queryName {
      $recipeFragment
    }
}
''';
