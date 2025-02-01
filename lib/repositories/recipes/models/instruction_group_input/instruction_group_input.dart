import 'package:freezed_annotation/freezed_annotation.dart';

part 'instruction_group_input.freezed.dart';
part 'instruction_group_input.g.dart';

@freezed
class InstructionGroupInput with _$InstructionGroupInput {
  @JsonSerializable(explicitToJson: true)
  const factory InstructionGroupInput({
    String? title,
    required List<String>? instructions,
  }) = _InstructionGroupInput;

  factory InstructionGroupInput.fromJson(Map<String, Object?> json) =>
      _$InstructionGroupInputFromJson(json);
}
