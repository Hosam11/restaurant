import 'package:get/get.dart';
import 'package:restaurant/utils/services/api_services.dart';

mixin ServiceMixin {
  //
  final postMethod = 'POST';
  final getMethod = 'Get';
  // form data keys
  final nameKey = 'name';
  final mobileKey = 'mobile';
  final passwordKey = 'password';
  final passwordConfirmationKey = 'password_confirmation';
  // urls
  final signupUrl = 'auth/register';
  final loginUrl = 'auth/login';

  final _api = Get.find<ApiService>();

  ApiService get api => _api;
}
