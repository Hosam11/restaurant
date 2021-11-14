// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterUser _$RegisterUserFromJson(Map<String, dynamic> json) {
  return RegisterUser(
    mobile: json['mobile'] as String,
    name: json['name'] as String,
    id: json['id'] as int,
    accessToken: json['access_token'] as String,
    accessProvider: json['access_provider'] as String,
  );
}

Map<String, dynamic> _$RegisterUserToJson(RegisterUser instance) =>
    <String, dynamic>{
      'mobile': instance.mobile,
      'name': instance.name,
      'id': instance.id,
      'access_token': instance.accessToken,
      'access_provider': instance.accessProvider,
    };
