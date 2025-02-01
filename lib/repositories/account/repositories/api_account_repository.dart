import 'package:mobile/app_services/api_service/api_service.dart';
import 'package:mobile/business_logic/account_logic/account_repository_interface.dart';
import 'package:mobile/business_logic/models/account/account.dart';
import 'package:mobile/business_logic/models/json_schema/json_schema.dart';
import 'package:mobile/repositories/common/graph_ql/graph_ql_mutation.dart';
import 'package:mobile/repositories/account/graph_ql/create_email_account_graph_ql.dart';
import 'package:mobile/repositories/common/graph_ql/graph_ql_query.dart';
import 'package:mobile/repositories/recipes/graph_ql/get_all_validation_schemas.dart';
import 'package:mobile/repositories/account/graph_ql/request_verification_email_graph_ql.dart';
import 'package:mobile/repositories/account/graph_ql/sign_into_email_account_graph_ql.dart';
import 'package:mobile/repositories/account/models/create_email_account_input/create_email_account_input.dart';
import 'package:mobile/repositories/common/models/either/either.dart';
import 'package:mobile/repositories/common/models/failure/failure.dart';
import 'package:mobile/repositories/account/models/request_verification_email_input/request_verification_email_input.dart';
import 'package:mobile/repositories/account/models/sign_into_email_account_input/sign_into_email_account_input.dart';

const noValidationSchemasMessage = 'Could not get any validation schemas!';
const failedToFetchValidationSchemas = 'Failed to fetch validation schemas!';
const noCreatedAccountMessage = 'Could not create account!';
const noSignedInAccountMessage = 'Could not sign in!';
const defaultErrorMessage = 'Something went wrong...';

class ApiAccountRepository extends AccountRepository {
  final ApiService _apiService;

  ApiAccountRepository(this._apiService);

  @override
  Future<Either<Failure, Map<ValidationTarget, JsonSchema>>>
      fetchValidationSchemas(
    List<ValidationTarget> schemasToQuery,
  ) async {
    final query = FetchValidationSchemasQuery(schemas: schemasToQuery);
    return _handleMutationExpectingValidationSchemas(query);
  }

  @override
  Future<Either<Failure, Account>> createAnEmailAccount({
    required String username,
    required String email,
    required String password,
  }) async {
    final input = CreateEmailAccountInput(
        username: username, email: email, password: password);
    final mutation = CreateEmailAccountMutation(input);
    return _handleMutationExpectingAccount(mutation, noSignedInAccountMessage);
  }

  @override
  Future<Either<Failure, Account>> signInToAnEmailAccount({
    required String email,
    required String password,
  }) async {
    final input = SignIntoEmailAccountInput(email: email, password: password);
    final mutation = SignIntoEmailAccountMutation(input);
    return _handleMutationExpectingAccount(mutation, noSignedInAccountMessage);
  }

  @override
  Future<Either<Failure, String>> requestVerificationEmail(
      {required String email}) async {
    final input = RequestVerificationEmailInput(email: email);
    final mutation = RequestVerificationEmailMutation(input);
    return _handleMutationExpectingGeneralResult(mutation);
  }

  @override
  Future<Either<Failure, String>> deleteAccount({
    required int id,
    required String uuid,
  }) async {
    // FIXME: Implement deleting account and related data in API SERVER CODE!!!
    // final input = DeleteAccountInput(id: id, uuid: uuid);
    // final mutation = DeleteAccountMutation(input);
    // return _handleMutationExpectingGeneralResult(mutation);
    return Either.failure(
        const Failure('Deleting accounts is not implemented yet'));
  }

  Future<Either<Failure, Map<ValidationTarget, JsonSchema>>>
      _handleMutationExpectingValidationSchemas(
    GraphQLQuery query,
  ) async {
    final response =
        await _apiService.performQuery(query.query, query.variables);

    return response.match<Either<Failure, Map<ValidationTarget, JsonSchema>>>(
        (data) {
      if (data == null) {
        return Either.failure(const Failure(noValidationSchemasMessage));
      }
      if (data.isEmpty) return Either.value({});

      Map<ValidationTarget, JsonSchema> validationSchemas = {};
      for (final item in data[query.name]) {
        final target = ValidationTarget.values.byName(item['target']);
        final schema = JsonSchema.fromJson(item['schema']);
        validationSchemas[target] = schema;
      }

      return Either.value(validationSchemas);
    }, (failure) {
      return Either.failure(const Failure(failedToFetchValidationSchemas));
    });
  }

  Future<Either<Failure, Account>> _handleMutationExpectingAccount(
    GraphQLMutation mutation,
    String noDataMessage,
  ) async {
    final response =
        await _apiService.performMutation(mutation.query, mutation.variables!);

    return response.match<Either<Failure, Account>>(
      (data) {
        if (data == null || data.isEmpty) {
          return Either.failure(Failure(noDataMessage));
        }

        final isError = data[mutation.name]['__typename'] != 'Account';
        if (isError) {
          final message = data[mutation.name]['errorMessage'];
          return Either.failure(Failure(message));
        }

        final Account account = Account.fromJson((data[mutation.name]));
        return Either.value(account);
      },
      (failure) {
        return Either.failure(failure);
      },
    );
  }

  Future<Either<Failure, String>> _handleMutationExpectingGeneralResult(
    GraphQLMutation mutation,
  ) async {
    final response =
        await _apiService.performMutation(mutation.query, mutation.variables!);

    return response.match<Either<Failure, String>>(
      (data) {
        if (data == null || data.isEmpty) {
          return Either.failure(const Failure(defaultErrorMessage));
        }

        final isError = data[mutation.name]['__typename'] != 'GeneralError';
        if (isError) {
          final message = data[mutation.name]['errorMessage'];
          return Either.failure(Failure(message));
        }

        final String message = data[mutation.name]['successMessage'];
        return Either.value(message);
      },
      (failure) {
        return Either.failure(failure);
      },
    );
  }
}
