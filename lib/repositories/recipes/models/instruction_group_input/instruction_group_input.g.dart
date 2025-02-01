// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instruction_group_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InstructionGroupInputImpl _$$InstructionGroupInputImplFromJson(
        Map<String, dynamic> json) =>
    _$InstructionGroupInputImpl(
      title: json['title'] as String?,
      instructions: (json['instructions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$InstructionGroupInputImplToJson(
        _$InstructionGroupInputImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'instructions': instance.instructions,
    };
