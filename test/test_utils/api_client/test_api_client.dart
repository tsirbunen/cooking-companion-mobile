import 'package:mobile/core/api_service/api_client.dart';
import 'package:mobile/utils/graph_ql/graph_ql_query.dart';
import 'graphql_client_mock.dart';

/// The getTestApiClient function takes as its arguments the query
/// that will be performed in the test and the response that it should return.
ApiClient getTestApiClient(
  GraphQLQuery query,
  Map<String, List<Map<String, Object>>> testData,
) {
  final apiClient = ApiClient();
  apiClient.initialize(client: getGraphQLClientMock(testData, query));

  return apiClient;
}
