import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_account_input.freezed.dart';
part 'delete_account_input.g.dart';

@freezed
class DeleteAccountInput with _$DeleteAccountInput {
  @JsonSerializable(explicitToJson: true)
  const factory DeleteAccountInput({
    required int id,
    required String uuid,
  }) = _DeleteAccountInput;

  factory DeleteAccountInput.fromJson(Map<String, Object?> json) =>
      _$DeleteAccountInputFromJson(json);
}
