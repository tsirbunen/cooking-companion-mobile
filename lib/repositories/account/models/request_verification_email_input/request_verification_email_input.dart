import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_verification_email_input.freezed.dart';
part 'request_verification_email_input.g.dart';

@freezed
class RequestVerificationEmailInput with _$RequestVerificationEmailInput {
  @JsonSerializable(explicitToJson: true)
  const factory RequestVerificationEmailInput({
    required String email,
  }) = _RequestVerificationEmailInput;

  factory RequestVerificationEmailInput.fromJson(Map<String, Object?> json) =>
      _$RequestVerificationEmailInputFromJson(json);
}
