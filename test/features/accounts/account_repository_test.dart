import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/repositories/recipes/graph_ql/get_all_validation_schemas.dart';
import 'package:mobile/repositories/account/repositories/api_account_repository.dart';
import '../../utils/test_api_service.dart';
import 'create_email_account_data.dart';
import 'email_account_validation_schema_data.dart';
import 'helpers.dart';

void main() {
  group('ACCOUNT REPOSITORY -', () {
    test('fetches "create email account" validation schema', () async {
      prepareTestApiServiceForFetchAccountValidationSchemasQuery();
      final accountRepository = ApiAccountRepository(testApiService);

      final response = await accountRepository.fetchValidationSchemas([
        ValidationTarget.EMAIL_ACCOUNT_INPUT,
        ValidationTarget.SIGN_IN_TO_EMAIL_ACCOUNT_INPUT,
        ValidationTarget.REQUEST_VERIFICATION_EMAIL_INPUT,
      ]);

      final schemas = response.valueOrNull;
      expect(schemas!.length, 3);
      final schema = schemas[ValidationTarget.EMAIL_ACCOUNT_INPUT];
      expect(schema, isNotNull);
      expect(schema!.title, emailAccountValidationSchemaTitle);
    });

    test('creates new email account', () async {
      prepareTestApiServiceForCreateEmailAccountMutation();
      final accountRepository = ApiAccountRepository(testApiService);

      final response = await accountRepository.createAnEmailAccount(
        username: username,
        email: email,
        password: password,
      );

      final account = response.valueOrNull;
      expect(account, isNotNull);
      expect(account!.username, testAccountData['username']);
      expect(account.email, testAccountData['email']);
    });
  });
}
