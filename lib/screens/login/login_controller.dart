import 'package:fimber/fimber.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restaurant/api_services/auth_services/login_service.dart';
import 'package:restaurant/constants/strings.dart';
import 'package:restaurant/models/register_user/register_user.dart';
import 'package:restaurant/utils/dialog/dialogs.dart';
import 'package:restaurant/utils/mixins/validators.dart';
import 'package:restaurant/utils/services/storage_service.dart';

class LoginController extends GetxController with ValidatorsMixin {
  final loginService = LoginService();
  final formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final psdController = TextEditingController();
  final _visiblePsd = false.obs;

  bool get visiblePsd => _visiblePsd.value;

  void toggleVisiblePsd() => _visiblePsd.value = !_visiblePsd.value;

  String? validatePassword(String? psd) {
    final isValid = validateEmptyField(psd);
    if (isValid == null) {
      if (psd!.length < 8) {
        return incorrectPasswordLength;
      }
    } else {
      return requiredFiled;
    }
  }

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
    psdController.dispose();
  }

  Future<void> loginPressed() async {
    final valid = formKey.currentState?.validate();
    if (valid != null) {
      if (valid) {
        Fimber.i('login vaild ');
        try {
          startLoading();
          final user = await loginService.loginCall(
            phoneController.text,
            psdController.text,
          );
          if (user != null) {
            await saveUserData(RegisterUser(
              mobile: user.mobile,
              name: user.name,
              id: user.id,
              accessToken: user.accessToken,
              accessProvider: user.accessProvider,
            ));
            stopLoading();
            // todo for test
            Get.defaultDialog(title: 'go home');
          } else {
            stopLoading();
          }
        } catch (e) {
          Fimber.i('catch $e');
        }
      }
    }
  }

  Future<void> saveUserData(RegisterUser user) async =>
      await Get.find<StorageService>().setUserData(user);
}
