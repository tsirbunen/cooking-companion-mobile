import 'package:mobile/repositories/recipes/graph_ql/get_all_validation_schemas.dart';

typedef ValidatorFn = String? Function(String?)?;

enum Field {
  username,
  email,
  password,
  passwordConfirm,
}

enum EmailAccountAction { signUp, signIn, requestVerificationEmail }

extension EmailAccountActionTitleExtension on EmailAccountAction {
  String title() {
    switch (this) {
      case EmailAccountAction.signIn:
        return 'SIGN IN';
      case EmailAccountAction.signUp:
        return 'SIGN UP';
      case EmailAccountAction.requestVerificationEmail:
        return 'GET VERIFICATION EMAIL';
      default:
        throw Exception('EmailAccountAction title not implemented!');
    }
  }
}

extension EmailAccountActionInfoExtension on EmailAccountAction {
  String info() {
    switch (this) {
      case EmailAccountAction.signIn:
        return 'If you have already created an account, you can sign in with your email and your password. Note that you must have verified your email address to be able to sign in.';
      case EmailAccountAction.signUp:
        return 'You can create an account using your email and a password. Note that you need access to that email so that you can verify your account.';
      case EmailAccountAction.requestVerificationEmail:
        return 'In case you did not receive an account verification email on creating your account you can request a new one to be sent to your email address.';
      default:
        throw Exception('EmailAccountAction title not implemented!');
    }
  }
}

extension IsEmailAccountActionFormField on EmailAccountAction {
  bool isField(Field field) {
    switch (this) {
      case EmailAccountAction.signIn:
        return field == Field.email || field == Field.password;
      case EmailAccountAction.signUp:
        return field == Field.username ||
            field == Field.email ||
            field == Field.password ||
            field == Field.passwordConfirm;
      case EmailAccountAction.requestVerificationEmail:
        return field == Field.email;
      default:
        throw Exception('EmailAccountAction isActionField not implemented!');
    }
  }
}

extension EmailAccountActionToValidationTarget on EmailAccountAction {
  ValidationTarget toTarget() {
    return switch (this) {
      EmailAccountAction.signUp => ValidationTarget.EMAIL_ACCOUNT_INPUT,
      EmailAccountAction.signIn =>
        ValidationTarget.SIGN_IN_TO_EMAIL_ACCOUNT_INPUT,
      EmailAccountAction.requestVerificationEmail =>
        ValidationTarget.REQUEST_VERIFICATION_EMAIL_INPUT,
    };
  }
}
