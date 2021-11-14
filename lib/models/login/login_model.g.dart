// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) {
  return LoginModel(
    json['email'],
    json['gender'],
    json['birthDate'],
    json['newsLetter'] as int?,
    json['offers'] as int?,
    json['emailVerifiedAt'],
    json['mobileVerifiedAt'],
    json['img'] as String?,
    json['notification'] as int?,
    json['rememberToken'],
    json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    json['socialAccountsCount'] as int?,
    mobile: json['mobile'] as String,
    name: json['name'] as String,
    id: json['id'] as int,
    accessToken: json['access_token'] as String,
    accessProvider: json['access_provider'] as String,
  );
}

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'mobile': instance.mobile,
      'name': instance.name,
      'id': instance.id,
      'access_token': instance.accessToken,
      'access_provider': instance.accessProvider,
      'email': instance.email,
      'gender': instance.gender,
      'birthDate': instance.birthDate,
      'newsLetter': instance.newsLetter,
      'offers': instance.offers,
      'emailVerifiedAt': instance.emailVerifiedAt,
      'mobileVerifiedAt': instance.mobileVerifiedAt,
      'img': instance.img,
      'notification': instance.notification,
      'rememberToken': instance.rememberToken,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'socialAccountsCount': instance.socialAccountsCount,
    };
