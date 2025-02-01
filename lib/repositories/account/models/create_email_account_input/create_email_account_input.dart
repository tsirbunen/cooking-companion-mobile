import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_email_account_input.freezed.dart';
part 'create_email_account_input.g.dart';

@freezed
class CreateEmailAccountInput with _$CreateEmailAccountInput {
  @JsonSerializable(explicitToJson: true)
  const factory CreateEmailAccountInput({
    required String username,
    required String email,
    required String password,
  }) = _CreateEmailAccountInput;

  factory CreateEmailAccountInput.fromJson(Map<String, Object?> json) =>
      _$CreateEmailAccountInputFromJson(json);
}
