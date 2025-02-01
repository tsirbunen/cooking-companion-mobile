import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_into_email_account_input.freezed.dart';
part 'sign_into_email_account_input.g.dart';

@freezed
class SignIntoEmailAccountInput with _$SignIntoEmailAccountInput {
  @JsonSerializable(explicitToJson: true)
  const factory SignIntoEmailAccountInput({
    required String email,
    required String password,
  }) = _SignIntoEmailAccountInput;

  factory SignIntoEmailAccountInput.fromJson(Map<String, Object?> json) =>
      _$SignIntoEmailAccountInputFromJson(json);
}
