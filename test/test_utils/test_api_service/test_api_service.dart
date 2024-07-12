import 'package:graphql/client.dart';
import 'package:mobile/app_services/api_service/api_service.dart';
import 'package:mobile/repositories_and_data/graph_ql/queries_and_mutations/create_recipe_graph_ql.dart';
import 'package:mobile/repositories_and_data/graph_ql/queries_and_mutations/get_all_recipes_graph_ql.dart';
import '../data/all_recipes_test_data.dart';
import '../data/create_recipe_test_data.dart';
import '../graph_ql_client_mock/graphql_client_mock.dart';

// Note: The ApiService is a singleton which complicates our testing a bit.
final testApiService = ApiService();

// Below are functions that can be called to prepare the ApiService to
// respond to a specific query or mutation with specific data. The idea is to
// call these functions multiple times within a test if needed to prepare for
// different consecutive queries or mutations.

prepareTestApiServiceForAllRecipesQuery() {
  final query = GetAllRecipesQuery();
  _initializeApiService(getGraphQLClientQueryMock(allRecipesTestData, query));
}

prepareTestApiServiceForAllRecipesQueryFailure() {
  final query = GetAllRecipesQuery();
  _initializeApiService(getGraphQLClientErrorMock(query));
}

prepareTestApiServiceForCreateRecipeMutation() {
  final mutation = CreateRecipeMutation(createRecipeTestInput);
  _initializeApiService(
      getGraphQLClientMutationMock(createRecipeTestData, mutation));
}

_initializeApiService(GraphQLClient graphQLClientMock) {
  testApiService.initialize(client: graphQLClientMock);
}
