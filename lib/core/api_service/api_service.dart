import 'package:graphql/client.dart';
import 'package:mobile/core/api_service/graphql_query_interceptor.dart';
import 'dart:async';
import 'package:mobile/utils/either/either.dart';
import 'package:mobile/utils/failure/failure.dart';

const httpHeaders = {'Content-Type': 'application/json', 'charset': 'UTF-8'};
const apiUrl = 'https://cookbook-dusky.vercel.app/api/graphql';
const apiErrorLabel = 'Api error:';
const defaultException = 'Oops! Some error occurred...';

// Note: We will not make this class a singleton. Instead, we use the
// api service trough a riverpod provider.
class ApiService {
  late HttpLink _httpLink;
  late GraphQLClient _graphQLClient;

  // Note: The optional client parameter is allowed here so that a mock client
  // can be injected during testing.
  ApiService initialize({
    GraphQLClient? client,
    bool withQueryInterceptor = false,
  }) {
    _httpLink = HttpLink(apiUrl);
    _graphQLClient = client ??
        GraphQLClient(
          link: withQueryInterceptor
              ? GraphQLQueryInterceptor(_httpLink)
              : _httpLink,
          cache: GraphQLCache(),
        );
    return this;
  }

  Future<Either<Failure, Map<String, dynamic>>> performQuery(
      String query) async {
    try {
      final QueryOptions options = QueryOptions(document: gql(query));
      final QueryResult response = await _graphQLClient.query(options);

      if (response.hasException || response.data == null) {
        final exception = response.exception;
        return Either.failure(Failure('$apiErrorLabel $exception'));
      }

      return Either.value(response.data!);
    } catch (exception) {
      return Either.failure(Failure('$apiErrorLabel $exception'));
    }
  }
}
