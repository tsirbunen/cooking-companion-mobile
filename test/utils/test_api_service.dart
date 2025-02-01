import 'package:graphql/client.dart';
import 'package:mobile/app_services/api_service/api_service.dart';
import 'package:mobile/repositories/recipes/graph_ql/create_recipe_graph_ql.dart';
import 'package:mobile/repositories/recipes/graph_ql/get_all_recipes_graph_ql.dart';
import '../features/recipes/all_recipes_test_data.dart';
import '../features/recipes/create_recipe_test_data.dart';
import 'graphql_client_mock.dart';

// Note: The ApiService is a singleton which complicates our testing a bit.
final testApiService = ApiService();

// Below are functions that can be called to prepare the ApiService to
// respond to a specific query or mutation with specific data. The idea is to
// call these functions multiple times within a test if needed to prepare for
// different consecutive queries or mutations.

prepareTestApiServiceForAllRecipesQuery() {
  final query = GetAllRecipesQuery();
  initializeApiService(getGraphQLClientQueryMock(allRecipesTestData, query));
}

prepareTestApiServiceForAllRecipesQueryFailure() {
  final query = GetAllRecipesQuery();
  initializeApiService(getGraphQLClientErrorMock(query));
}

prepareTestApiServiceForCreateRecipeMutation() {
  final mutation = CreateRecipeMutation(createRecipeTestInput);
  initializeApiService(
      getGraphQLClientMutationMock(createRecipeTestData, mutation));
}

initializeApiService(GraphQLClient graphQLClientMock) {
  testApiService.initialize(client: graphQLClientMock);
}
