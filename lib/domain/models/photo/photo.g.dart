// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PhotoImpl _$$PhotoImplFromJson(Map<String, dynamic> json) => _$PhotoImpl(
      id: (json['id'] as num).toInt(),
      url: json['url'] as String,
      isMainPhoto: json['isMainPhoto'] as bool?,
    );

Map<String, dynamic> _$$PhotoImplToJson(_$PhotoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'isMainPhoto': instance.isMainPhoto,
    };
