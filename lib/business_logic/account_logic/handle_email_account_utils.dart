import 'package:mobile/business_logic/account_logic/account_repository_interface.dart';
import 'package:mobile/business_logic/account_logic/account_state.dart';
import 'package:mobile/business_logic/models/account/account.dart';
import 'package:mobile/business_logic/models/bloc_status/bloc_status.dart';
import 'package:mobile/repositories/common/models/either/either.dart';
import 'package:mobile/repositories/common/models/failure/failure.dart';

const emailAccountCreatedMessage = 'Successfully created an account';
const emailAccountSignedInMessage = 'Successfully signed in';
const emailVerificationRequestedMessage =
    'Email verification successfully requested';
const accountDeletedMessage =
    'Account and all its data successfully deleted for good';

// These helper functions handle the communication with the account repository to create
// an email account, to sign into an email account, and to request a verification email.

Future<AccountState> handleCreateAnEmailAccount(
  AccountRepository repository,
  AccountState state,
) async {
  final result = await repository.createAnEmailAccount(
      username: state.username!,
      email: state.email!,
      password: state.password!);
  return _handleAccountResult(state, result, emailAccountSignedInMessage);
}

Future<AccountState> handleSignIntoAnEmailAccount(
  AccountRepository repository,
  AccountState state,
) async {
  final result = await repository.signInToAnEmailAccount(
      email: state.email!, password: state.password!);
  return _handleAccountResult(state, result, emailAccountSignedInMessage);
}

Future<AccountState> handleRequestVerificationEmail(
  AccountRepository repository,
  AccountState state,
) async {
  final result = await repository.requestVerificationEmail(email: state.email!);
  return result.match(
    (data) => _stateOnSuccess(state, emailVerificationRequestedMessage, null),
    (failure) => _stateOnFailure(state, failure.message),
  );
}

Future<AccountState> handleDeleteAccount(
  AccountRepository repository,
  AccountState state,
) async {
  Account currentAccount = state.currentAccount!;
  final result = await repository.deleteAccount(
      id: currentAccount.id, uuid: currentAccount.uuid);
  return result.match(
    (data) => _stateOnSuccess(state, accountDeletedMessage, null),
    (failure) => _stateOnFailure(state, failure.message),
  );
}

AccountState _handleAccountResult(
  AccountState state,
  Either<Failure, Account> accountResult,
  String successMessage,
) {
  return accountResult.match(
    (data) => _stateOnSuccess(state, successMessage, data),
    (failure) => _stateOnFailure(state, failure.message),
  );
}

AccountState _stateOnSuccess(
  AccountState state,
  String successMessage,
  Account? newCurrentAccount,
) {
  return state.copyWith(
      newStatus: BlocStatus(Status.success, message: successMessage),
      newCurrentAccount: newCurrentAccount ?? state.currentAccount);
}

AccountState _stateOnFailure(AccountState state, String message) {
  return state.copyWith(newStatus: BlocStatus(Status.error, message: message));
}
