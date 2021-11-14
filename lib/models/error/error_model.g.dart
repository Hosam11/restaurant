// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorModel _$ErrorModelFromJson(Map<String, dynamic> json) {
  return ErrorModel(
    (json['name'] as List<dynamic>?)?.map((e) => e as String).toList(),
    (json['password'] as List<dynamic>?)?.map((e) => e as String).toList(),
    mobile:
        (json['mobile'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$ErrorModelToJson(ErrorModel instance) =>
    <String, dynamic>{
      'mobile': instance.mobile,
      'name': instance.name,
      'password': instance.password,
    };
