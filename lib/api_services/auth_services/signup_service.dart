import 'dart:convert';
import 'dart:developer';
import 'package:fimber/fimber.dart';
import 'package:restaurant/models/register_user/register_user.dart';
import 'package:restaurant/models/user_register_body.dart';
import 'package:restaurant/utils/services/api_services.dart';
import 'package:restaurant/utils/services/service_helper.dart';
import 'package:dio/dio.dart' as dio;

const _nameKey = 'name';
const _mobileKey = 'mobile';
const _passwordKey = 'password';
const _passwordConfirmationKey = 'password_confirmation';

class SignupService extends ServiceHelper {
  Future<RegisterUser?> registerCall(UserRegisterBody userBody) async {
    final body = dio.FormData.fromMap({
      _nameKey: userBody.name,
      _mobileKey: userBody.phone,
      _passwordKey: userBody.password,
      _passwordConfirmationKey: userBody.confirmPassword,
    });

    Fimber.i('userBody= ${body.fields}');
    final data = await api.request(
      signupUrl,
      postMethod,
      data: body,
      contentType: 'multipart/form-data',
    );
    if (data != null) {
      return RegisterUser.fromJson(data);
    }
    /*final user = RegisterUser.fromJson(data);
    Fimber.i('user= ${user.id}');
    return user;*/
  }
}
