import 'package:mobile/core/api_service/api_service.dart';
import 'package:mobile/utils/graph_ql/graph_ql_query.dart';
import 'graphql_client_mock.dart';

/// The getTestApiService function takes as its arguments the query
/// that will be performed in the test and the response that it should return.
ApiService getTestApiService({
  GraphQLQuery? query,
  Map<String, List<Map<String, Object>>>? responseData,
  bool? isException,
}) {
  final apiService = ApiService();
  if (query != null && isException != null && isException) {
    apiService.initialize(client: getGraphQLClientErrorMock(query));
  } else if (query != null && responseData != null) {
    apiService.initialize(
        client: getGraphQLClientQueryMock(responseData, query));
  } else {
    throw Exception('Api test client data missing!');
  }

  return apiService;
}
