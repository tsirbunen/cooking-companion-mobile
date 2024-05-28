// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instruction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InstructionImpl _$$InstructionImplFromJson(Map<String, dynamic> json) =>
    _$InstructionImpl(
      id: (json['id'] as num).toInt(),
      content: json['content'] as String,
      previousId: (json['previousId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$InstructionImplToJson(_$InstructionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'previousId': instance.previousId,
    };
