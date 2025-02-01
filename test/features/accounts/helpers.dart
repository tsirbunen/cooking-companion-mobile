import 'package:mobile/repositories/account/graph_ql/create_email_account_graph_ql.dart';
import 'package:mobile/repositories/recipes/graph_ql/get_all_validation_schemas.dart';
import 'create_email_account_data.dart';
import 'email_account_validation_schema_data.dart';
import '../../utils/graphql_client_mock.dart';
import '../../utils/test_api_service.dart';

prepareTestApiServiceForFetchAccountValidationSchemasQuery() {
  final query = FetchValidationSchemasQuery(schemas: [
    ValidationTarget.EMAIL_ACCOUNT_INPUT,
    ValidationTarget.SIGN_IN_TO_EMAIL_ACCOUNT_INPUT,
    ValidationTarget.REQUEST_VERIFICATION_EMAIL_INPUT,
  ]);
  initializeApiService(
      getGraphQLClientQueryMock(validationJsonSchemasTestData, query));
}

prepareTestApiServiceForCreateEmailAccountMutation() {
  final mutation = CreateEmailAccountMutation(createEmailAccountInput);
  initializeApiService(
      getGraphQLClientMutationMock(createEmailAccountTestData, mutation));
}
