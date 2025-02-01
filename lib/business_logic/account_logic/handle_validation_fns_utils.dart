import 'package:mobile/business_logic/account_logic/account_repository_interface.dart';
import 'package:mobile/business_logic/account_logic/helper_models.dart';
import 'package:mobile/business_logic/models/json_schema/json_schema.dart';
import 'package:mobile/business_logic/models/json_schema/utils_for_json_schema.dart';
import 'package:mobile/repositories/recipes/graph_ql/get_all_validation_schemas.dart';
import 'package:mobile/repositories/common/models/either/either.dart';
import 'package:mobile/repositories/common/models/failure/failure.dart';

const schemasToFetch = [
  ValidationTarget.EMAIL_ACCOUNT_INPUT,
  ValidationTarget.SIGN_IN_TO_EMAIL_ACCOUNT_INPUT,
  ValidationTarget.REQUEST_VERIFICATION_EMAIL_INPUT,
];

// These functions handle the communication with the account repository to fetch the validation
// json schemas and prepare the validator functions using the json schemas.

Future<Map<ValidationTarget, Map<Field, ValidatorFn>>> handlePrepareValidators(
    AccountRepository repository) async {
  Either<Failure, Map<ValidationTarget, JsonSchema>> result =
      await repository.fetchValidationSchemas(schemasToFetch);

  return result.match(
    (data) {
      if (data == null) return {};

      Map<ValidationTarget, Map<Field, ValidatorFn>> validationFnsByTarget = {};

      for (final entry in data.entries) {
        final ValidationTarget validationTarget = entry.key;
        final isTarget = schemasToFetch.contains(validationTarget);
        if (isTarget) {
          final JsonSchema schema = entry.value;
          final propertyValidationFns =
              convertJsonSchemaToPropertyValidationFns(schema);

          final formFieldValidationFns = _convertPropertyNameKeysToFormFields(
              validators: propertyValidationFns);
          validationFnsByTarget[validationTarget] = formFieldValidationFns;
        }
      }

      return validationFnsByTarget;
    },
    // Note: In case we fail to fetch the validation schemas, we just don't validate!
    // The server will then throw an error if the input is invalid.
    (failure) => {},
  );
}

Map<Field, ValidatorFn> _convertPropertyNameKeysToFormFields(
    {Map<String, ValidatorFn>? validators}) {
  Map<Field, ValidatorFn> validatorFns = {};

  if (validators == null) return validatorFns;

  final keys = validators.keys;
  if (keys.contains('username')) {
    validatorFns[Field.username] = validators['username'];
  }
  if (keys.contains('email')) {
    validatorFns[Field.email] = validators['email'];
  }
  if (keys.contains('password')) {
    final passwordValidator = validators['password'];
    validatorFns[Field.password] = passwordValidator;
    validatorFns[Field.passwordConfirm] = passwordValidator;
  }

  return validatorFns;
}
