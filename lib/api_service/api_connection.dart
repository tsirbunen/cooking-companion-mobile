import 'package:graphql/client.dart';
// import './graphql_queries.dart';

const httpHeaders = {'Content-Type': 'application/json', 'charset': 'UTF-8'};
const apiUrl = 'https://cookbook-dusky.vercel.app/api/graphql';

class ApiConnection {
  final HttpLink _httpLink = HttpLink(apiUrl);
  late GraphQLClient _graphQLClient;

  ApiConnection initialize() {
    _graphQLClient = GraphQLClient(link: _httpLink, cache: GraphQLCache());
    // performGraphQLQuery(getAllDataQuery);
    return this;
  }

  Future<QueryResult> performGraphQLQuery(String queryString) async {
    final QueryOptions options = QueryOptions(document: gql(queryString));
    final QueryResult result = await _graphQLClient.query(options);
    // print(result);
    return result;
  }
}
