import 'package:restaurant/models/login/login_model.dart';
import 'package:restaurant/utils/mixins/service_mixin.dart';
import 'package:dio/dio.dart' as dio;

class LoginService with ServiceMixin {
  Future<LoginModel?> loginCall(String mobile, password) async {
    final body = dio.FormData.fromMap({
      mobileKey: mobile,
      passwordKey: password,
    });

    final data = await api.request(
      loginUrl,
      postMethod,
      data: body,
      contentType: 'multipart/form-data',
    );

    if (data != null) {
      return LoginModel.fromJson(data);
    }
  }
}
