import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/business_logic/account_logic/account_event.dart';
import 'package:mobile/business_logic/account_logic/account_repository_interface.dart';
import 'package:mobile/business_logic/account_logic/account_state.dart';
import 'package:mobile/business_logic/account_logic/handle_email_account_utils.dart';
import 'package:mobile/business_logic/account_logic/handle_validation_fns_utils.dart';
import 'package:mobile/business_logic/account_logic/helper_models.dart';
import 'package:mobile/business_logic/models/bloc_status/bloc_status.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final AccountRepository _repository;

  AccountBloc(this._repository)
      : super(const AccountState(validationFnsByTarget: {})) {
    on<AccountEvent>(_onEvent);
  }

  Future<void> _onEvent(AccountEvent event, Emitter<AccountState> emit) async {
    return switch (event) {
      final PrepareValidationFns e => _onPrepareValidationFns(e, emit),
      final SubmitEmailAccountAction e => _onSubmitEmailAccountAction(e, emit),
      final ClearFormValues e => _onClearForm(e, emit),
      final UsernameChanged e => _onUsernameChanged(e, emit),
      final PasswordChanged e => _onPasswordChanged(e, emit),
      final PasswordConfirmChanged e => _onPasswordConfirmChanged(e, emit),
      final EmailChanged e => _onEmailChanged(e, emit),
      final SignOut e => _onSignOut(e, emit),
      final DeleteAccountPermanently e => _onDeleteAccount(e, emit),
      final AccountEvent _ => emit(state),
    };
  }

  Future<void> _onPrepareValidationFns(
      PrepareValidationFns event, Emitter<AccountState> emit) async {
    final validationFnsByTarget = await handlePrepareValidators(_repository);
    emit(state.copyWith(newValidationFnsByTarget: validationFnsByTarget));
  }

  Future<void> _onSubmitEmailAccountAction(
    SubmitEmailAccountAction event,
    Emitter<AccountState> emit,
  ) async {
    if (state.hasSomeError(event.action)) return;

    emit(state.copyWith(newStatus: const BlocStatus(Status.submitting)));

    AccountState newState;
    if (event.action == EmailAccountAction.signUp) {
      newState = await handleCreateAnEmailAccount(_repository, state);
    } else if (event.action == EmailAccountAction.signIn) {
      newState = await handleSignIntoAnEmailAccount(_repository, state);
    } else if (event.action == EmailAccountAction.requestVerificationEmail) {
      newState = await handleRequestVerificationEmail(_repository, state);
    } else {
      newState = state.copyWith(newStatus: const BlocStatus(Status.ok));
    }

    emit(newState);
  }

  Future<void> _onSignOut(
    SignOut event,
    Emitter<AccountState> emit,
  ) async {
    emit(AccountState(
      status: const BlocStatus(Status.ok),
      validationFnsByTarget: state.validationFnsByTarget,
    ));
  }

  Future<void> _onDeleteAccount(
    DeleteAccountPermanently event,
    Emitter<AccountState> emit,
  ) async {
    if (state.currentAccount == null) return;
    final newState = await handleDeleteAccount(_repository, state);
    emit(newState);
  }

  Future<void> _onClearForm(
    ClearFormValues event,
    Emitter<AccountState> emit,
  ) async {
    emit(AccountState(
      status: const BlocStatus(Status.ok),
      currentAccount: state.currentAccount,
      validationFnsByTarget: state.validationFnsByTarget,
    ));
  }

  Future<void> _onUsernameChanged(
    UsernameChanged event,
    Emitter<AccountState> emit,
  ) async {
    emit(state.copyWith(
      newUsername: event.username,
      newStatus: const BlocStatus(Status.dirty),
    ));
  }

  Future<void> _onPasswordChanged(
    PasswordChanged event,
    Emitter<AccountState> emit,
  ) async {
    emit(state.copyWith(
      newPassword: event.password,
      newStatus: const BlocStatus(Status.dirty),
    ));
  }

  Future<void> _onPasswordConfirmChanged(
    PasswordConfirmChanged event,
    Emitter<AccountState> emit,
  ) async {
    emit(state.copyWith(
      newPasswordConfirm: event.passwordConfirm,
      newStatus: const BlocStatus(Status.dirty),
    ));
  }

  Future<void> _onEmailChanged(
    EmailChanged event,
    Emitter<AccountState> emit,
  ) async {
    emit(state.copyWith(
      newEmail: event.email,
      newStatus: const BlocStatus(Status.dirty),
    ));
  }
}
