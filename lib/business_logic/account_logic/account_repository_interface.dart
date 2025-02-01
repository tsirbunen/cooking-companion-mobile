import 'package:mobile/business_logic/models/account/account.dart';
import 'package:mobile/business_logic/models/json_schema/json_schema.dart';
import 'package:mobile/repositories/recipes/graph_ql/get_all_validation_schemas.dart';
import 'package:mobile/repositories/common/models/either/either.dart';
import 'package:mobile/repositories/common/models/failure/failure.dart';

abstract class AccountRepository {
  Future<Either<Failure, Map<ValidationTarget, JsonSchema>>>
      fetchValidationSchemas(
    List<ValidationTarget> schemasToQuery,
  );

  Future<Either<Failure, Account>> createAnEmailAccount({
    required String username,
    required String email,
    required String password,
  });

  Future<Either<Failure, Account>> signInToAnEmailAccount({
    required String email,
    required String password,
  });

  Future<Either<Failure, String>> requestVerificationEmail({
    required String email,
  });

  Future<Either<Failure, String>> deleteAccount({
    required int id,
    required String uuid,
  });
}
