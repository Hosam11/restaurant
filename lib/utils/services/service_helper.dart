import 'package:get/get.dart';
import 'package:restaurant/utils/services/api_services.dart';

abstract class ServiceHelper {
  final signupUrl = 'auth/register';

  final _api = Get.find<ApiService>();
  ApiService get api => _api;
}
