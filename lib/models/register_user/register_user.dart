import 'package:json_annotation/json_annotation.dart';

part 'register_user.g.dart';

@JsonSerializable()
class RegisterUser {
  RegisterUser({
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

  Map<String, dynamic> toJson() => _$RegisterUserToJson(this);

  factory RegisterUser.fromJson(Map<String, dynamic> json) =>
      _$RegisterUserFromJson(json);
}
