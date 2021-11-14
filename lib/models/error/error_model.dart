import 'package:json_annotation/json_annotation.dart';

part 'error_model.g.dart';

@JsonSerializable()
class ErrorModel {
  ErrorModel(this.name, this.password, {this.mobile});

  final List<String>? mobile;
  final List<String>? name;
  final List<String>? password;

  Map<String, dynamic> toJson() => _$ErrorModelToJson(this);

  factory ErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorModelFromJson(json);

  @override
  String toString() {
    return 'ErrorModel{mobile: $mobile, name: $name, password: $password}';
  }
}
