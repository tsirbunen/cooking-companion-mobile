import 'package:flutter/foundation.dart';
import 'package:graphql/client.dart';
import 'package:mobile/app_services/api_service/graphql_query_interceptor.dart';
import 'package:mobile/app_services/logger/logger.dart';
import 'dart:async';
import 'package:mobile/repositories_and_data/models/either/either.dart';
import 'package:mobile/repositories_and_data/models/failure/failure.dart';

const httpHeaders = {'Content-Type': 'application/json', 'charset': 'UTF-8'};
const apiUrl = 'https://cookbook-dusky.vercel.app/api/graphql';
const apiErrorLabel = 'Api error:';
const defaultException = 'Oops! Some error occurred...';

// Note: Make this class a singleton!
class ApiService {
  late HttpLink _httpLink;
  late GraphQLClient _graphQLClient;
  bool _isInitialized = false;

  static ApiService? _instance;
  ApiService._();

  factory ApiService() {
    _instance ??= ApiService._();
    return _instance!;
  }

  // Note: The optional client parameter is allowed here so that a mock client
  // can be injected during testing.
  initialize({GraphQLClient? client, bool withQueryInterceptor = false}) {
    // Note: This is to allow re-initialization of the singleton when running tests.
    if (!kDebugMode && _isInitialized) return;

    _httpLink = HttpLink(apiUrl);
    _graphQLClient = client ??
        GraphQLClient(
          link: withQueryInterceptor
              ? GraphQLQueryInterceptor(_httpLink)
              : _httpLink,
          cache: GraphQLCache(),
        );

    _isInitialized = true;
  }

  // FIXME: Figure out why query interceptor logs only the first time a query
  // is made but logs every time a mutation is made.
  Future<Either<Failure, Map<String, dynamic>>> performQuery(
      String query) async {
    try {
      final QueryOptions options = QueryOptions(document: gql(query));
      final QueryResult response = await _graphQLClient.query(options);

      if (response.hasException || response.data == null) {
        final exception = response.exception;
        return _handleException(exception);
      }

      return Either.value(response.data!);
    } catch (exception) {
      return _handleException(exception);
    }
  }

  Future<Either<Failure, Map<String, dynamic>>> performMutation(
      String query, Map<String, dynamic> variables) async {
    try {
      final MutationOptions options = MutationOptions(
        document: gql(query),
        variables: variables,
      );
      final QueryResult response = await _graphQLClient.mutate(options);

      if (response.hasException || response.data == null) {
        final exception = response.exception;
        return _handleException(exception);
      }

      return Either.value(response.data!);
    } catch (exception) {
      return _handleException(exception);
    }
  }

  Either<Failure, Map<String, dynamic>> _handleException(exception) {
    final errorMessage = '$apiErrorLabel $exception';
    logger.error(errorMessage, runtimeType);
    return Either.failure(Failure(errorMessage));
  }
}
