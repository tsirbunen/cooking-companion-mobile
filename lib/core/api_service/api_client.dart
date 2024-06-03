import 'package:graphql/client.dart';

const httpHeaders = {'Content-Type': 'application/json', 'charset': 'UTF-8'};
const apiUrl = 'https://cookbook-dusky.vercel.app/api/graphql';

class ApiClient {
  final HttpLink _httpLink = HttpLink(apiUrl);
  late GraphQLClient _graphQLClient;

  ApiClient initialize() {
    _graphQLClient = GraphQLClient(link: _httpLink, cache: GraphQLCache());
    return this;
  }

  Future<QueryResult> performQuery(String queryString) async {
    final QueryOptions options = QueryOptions(document: gql(queryString));
    final QueryResult result = await _graphQLClient.query(options);
    return result;
  }
}
