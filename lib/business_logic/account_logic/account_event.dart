import 'package:mobile/business_logic/account_logic/helper_models.dart';

class AccountEvent {}

class PrepareValidationFns extends AccountEvent {}

class SubmitEmailAccountAction extends AccountEvent {
  final EmailAccountAction action;
  SubmitEmailAccountAction(this.action);
}

class ClearFormValues extends AccountEvent {}

class UsernameChanged extends AccountEvent {
  final String username;
  UsernameChanged(this.username);
}

class PasswordChanged extends AccountEvent {
  final String? password;
  PasswordChanged(this.password);
}

class PasswordConfirmChanged extends AccountEvent {
  final String? passwordConfirm;
  PasswordConfirmChanged(this.passwordConfirm);
}

class EmailChanged extends AccountEvent {
  final String? email;
  EmailChanged(this.email);
}

class SignOut extends AccountEvent {}

class DeleteAccountPermanently extends AccountEvent {}
