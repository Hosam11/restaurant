import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel {
  LoginModel(
    this.email,
    this.gender,
    this.birthDate,
    this.newsLetter,
    this.offers,
    this.emailVerifiedAt,
    this.mobileVerifiedAt,
    this.img,
    this.notification,
    this.rememberToken,
    this.createdAt,
    this.updatedAt,
    this.socialAccountsCount, {
    required this.mobile,
    required this.name,
    required this.id,
    required this.accessToken,
    required this.accessProvider,
  });

  final String mobile;
  final String name;
  final int id;
  @JsonKey(name: 'access_token')
  final String accessToken;
  @JsonKey(name: 'access_provider')
  final String accessProvider;

  final dynamic email;
  final dynamic gender;
  final dynamic birthDate;
  final int? newsLetter;
  final int? offers;
  final dynamic emailVerifiedAt;
  final dynamic mobileVerifiedAt;
  final String? img;
  final int? notification;
  final dynamic rememberToken;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? socialAccountsCount;

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
}
