// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instruction_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InstructionGroupImpl _$$InstructionGroupImplFromJson(
        Map<String, dynamic> json) =>
    _$InstructionGroupImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String?,
      instructions: (json['instructions'] as List<dynamic>)
          .map((e) => Instruction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$InstructionGroupImplToJson(
        _$InstructionGroupImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'instructions': instance.instructions,
    };
