import 'package:freezed_annotation/freezed_annotation.dart';
import '../instruction/instruction.dart';

part 'instruction_group.freezed.dart';
part 'instruction_group.g.dart';

@freezed
class InstructionGroup with _$InstructionGroup {
  const factory InstructionGroup({
    required int id,
    String? title,
    required List<Instruction> instructions,
  }) = _InstructionGroup;

  factory InstructionGroup.fromJson(Map<String, Object?> json) =>
      _$InstructionGroupFromJson(json);
}
