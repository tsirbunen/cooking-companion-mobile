import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/features/recipes/repository/graph_ql.dart';
import 'package:mobile/utils/graph_ql/graph_ql_query.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:graphql/client.dart';

@GenerateNiceMocks([MockSpec<GraphQLClient>()])
import 'graphql_client_mock.mocks.dart';

/// The getGraphQLClientMock function takes as its arguments the query
/// that will be performed in the test and the response that it should return.
GraphQLClient getGraphQLClientMock(
  Map<String, dynamic> testDataToReturn,
  GraphQLQuery query,
) {
  final GraphQLClient graphQLClient = MockGraphQLClient();

  final query = InitialRecipesQuery();
  final QueryOptions options = QueryOptions(document: gql(query.query));

  when(graphQLClient.query(options)).thenAnswer(
    (_) async => Future.value(
      QueryResult(
        data: testDataToReturn,
        options: options,
        source: QueryResultSource.network,
      ),
    ),
  );

  return graphQLClient;
}
