import 'package:equatable/equatable.dart';
import 'package:mobile/business_logic/account_logic/helper_models.dart';
import 'package:mobile/business_logic/models/account/account.dart';
import 'package:mobile/business_logic/models/bloc_status/bloc_status.dart';
import 'package:mobile/repositories/recipes/graph_ql/get_all_validation_schemas.dart';

const passwordMismatch = 'Passwords do not match';

class AccountState extends Equatable {
  final BlocStatus status;
  final Account? currentAccount;
  final String? username;
  final String? password;
  final String? passwordConfirm;
  final String? email;
  final Map<ValidationTarget, Map<Field, ValidatorFn>> validationFnsByTarget;

  const AccountState({
    this.status = const BlocStatus(Status.ok),
    this.validationFnsByTarget = const {},
    this.currentAccount,
    this.username,
    this.password,
    this.passwordConfirm,
    this.email,
  });

  AccountState copyWith({
    BlocStatus? newStatus,
    Map<ValidationTarget, Map<Field, ValidatorFn>>? newValidationFnsByTarget,
    Account? newCurrentAccount,
    String? newUsername,
    String? newPassword,
    String? newPasswordConfirm,
    String? newEmail,
  }) {
    return AccountState(
      status: newStatus ?? status,
      validationFnsByTarget: newValidationFnsByTarget ?? validationFnsByTarget,
      currentAccount: newCurrentAccount ?? currentAccount,
      username: _nonEmptyOrNull(newUsername, username),
      password: _nonEmptyOrNull(newPassword, password),
      passwordConfirm: _nonEmptyOrNull(newPasswordConfirm, passwordConfirm),
      email: _nonEmptyOrNull(newEmail, email),
    );
  }

  // Note: Copy with function does not always receive all the fields if they are not to be changed.
  // So in case a value is null, we keep the current value. In case we want to change the current
  // value to null, we have to pass an empty string.
  String? _nonEmptyOrNull(String? newValue, String? currentValue) {
    if (newValue == null) return currentValue;
    if (newValue.isEmpty) return null;
    return newValue;
  }

  bool hasSomeError(EmailAccountAction action) {
    final target = action.toTarget();
    final validationFns = validationFnsByTarget[target];

    return [
      if (action.isField(Field.username))
        validationFns?[Field.username]?.call(username),
      if (action.isField(Field.email)) validationFns?[Field.email]?.call(email),
      if (action.isField(Field.password))
        validationFns?[Field.password]?.call(password),
      if (action.isField(Field.passwordConfirm))
        getPasswordConfirmValidationFn().call(passwordConfirm),
    ].any((error) => error != null);
  }

  bool hasSomeValue(EmailAccountAction action) {
    final fields = _getRelevantEmailAccountActionFields(action);
    return fields.any((value) => value != null && value.isNotEmpty);
  }

  _getRelevantEmailAccountActionFields(EmailAccountAction action) {
    if (action == EmailAccountAction.requestVerificationEmail) return [email];
    if (action == EmailAccountAction.signIn) return [email, password];
    if (action == EmailAccountAction.signUp) {
      return [username, password, passwordConfirm, email];
    }
    return [];
  }

  getPasswordConfirmValidationFn() {
    const target = ValidationTarget.EMAIL_ACCOUNT_INPUT;
    final validateFn = validationFnsByTarget[target]?[Field.passwordConfirm];

    return (String? passwordConfirm) {
      if (passwordConfirm != password) return passwordMismatch;
      if (validateFn == null) return null;
      return validateFn(passwordConfirm);
    };
  }

  @override
  List<Object?> get props => [
        status,
        currentAccount,
        username,
        password,
        passwordConfirm,
        email,
        validationFnsByTarget,
      ];

  @override
  String toString() {
    final accountString = currentAccount == null
        ? 'current account: null'
        : 'current account: ${currentAccount!.username}, ${currentAccount!.email}, ${currentAccount!.id}, ${currentAccount!.identityProvider}, has token: ${currentAccount!.token != null}';

    return 'ACCOUNT STATE:\t\nstatus: ${status.status}\t\n$accountString\t\nusername: $username,\t\npassword: $password,\t\npasswordConfirm: $passwordConfirm,\t\nemail: $email,\t\nvalidation targets: ${validationFnsByTarget.keys}';
  }
}
