// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JsonSchemaImpl _$$JsonSchemaImplFromJson(Map<String, dynamic> json) =>
    _$JsonSchemaImpl(
      title: json['title'] as String,
      description: json['description'] as String,
      type: json['type'] as String,
      required:
          (json['required'] as List<dynamic>).map((e) => e as String).toList(),
      properties: json['properties'] as Map<String, dynamic>,
      errorMessage: json['errorMessage'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$JsonSchemaImplToJson(_$JsonSchemaImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'type': instance.type,
      'required': instance.required,
      'properties': instance.properties,
      'errorMessage': instance.errorMessage,
    };
