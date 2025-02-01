// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountImpl _$$AccountImplFromJson(Map<String, dynamic> json) =>
    _$AccountImpl(
      id: (json['id'] as num).toInt(),
      uuid: json['uuid'] as String,
      username: json['username'] as String,
      token: json['token'] as String?,
      email: json['email'] as String?,
      emailVerified: json['emailVerified'] as bool?,
      identityProvider:
          $enumDecode(_$IdentityProviderEnumMap, json['identityProvider']),
    );

Map<String, dynamic> _$$AccountImplToJson(_$AccountImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      'username': instance.username,
      'token': instance.token,
      'email': instance.email,
      'emailVerified': instance.emailVerified,
      'identityProvider': _$IdentityProviderEnumMap[instance.identityProvider]!,
    };

const _$IdentityProviderEnumMap = {
  IdentityProvider.EMAIL: 'EMAIL',
  IdentityProvider.GITHUB: 'GITHUB',
  IdentityProvider.FACEBOOK: 'FACEBOOK',
};
