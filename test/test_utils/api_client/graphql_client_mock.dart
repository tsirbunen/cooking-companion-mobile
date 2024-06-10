import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/features/recipes/repository/graph_ql.dart';
import 'package:mobile/utils/graph_ql/graph_ql_query.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:graphql/client.dart';

@GenerateNiceMocks([MockSpec<GraphQLClient>()])
import 'graphql_client_mock.mocks.dart';

/// This function takes as its arguments the query that the GraphQL client
/// will perform in the test and the response data that should be returned.
GraphQLClient getGraphQLClientQueryMock(
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

/// This function takes as its argument the error that the GraphQL client
/// return when the query is performed.
GraphQLClient getGraphQLClientErrorMock(GraphQLQuery query) {
  final GraphQLClient graphQLClient = MockGraphQLClient();

  final query = InitialRecipesQuery();
  final QueryOptions options = QueryOptions(document: gql(query.query));

  when(graphQLClient.query(options)).thenAnswer(
    (_) async => Future.value(
      QueryResult(
        exception: serverException,
        options: options,
        source: QueryResultSource.network,
      ),
    ),
  );

  return graphQLClient;
}

final serverException = OperationException(
  linkException: ServerException(
    originalException: ArgumentError('Some exception'),
  ),
);
