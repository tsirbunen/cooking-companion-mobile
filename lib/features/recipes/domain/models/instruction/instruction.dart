import 'package:freezed_annotation/freezed_annotation.dart';

part 'instruction.freezed.dart';
part 'instruction.g.dart';

@freezed
class Instruction with _$Instruction {
  const factory Instruction({
    required int id,
    required String content,
    int? previousId,
  }) = _Instruction;

  factory Instruction.fromJson(Map<String, Object?> json) =>
      _$InstructionFromJson(json);
}
