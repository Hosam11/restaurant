import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/api_services/auth_services/signup_service.dart';
import 'package:restaurant/constants/strings.dart';
import 'package:restaurant/models/register_user/register_user.dart';
import 'package:restaurant/models/user_register_body.dart';
import 'package:restaurant/routes.dart';
import 'package:restaurant/utils/dialog/dialogs.dart';
import 'package:restaurant/utils/mixins/auth_helper_mixin.dart';
import 'package:restaurant/utils/services/storage_service.dart';

class SignupController extends GetxController with AuthHelperMixin {
  final signupService = SignupService();
  final formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final phoneController = TextEditingController();
  final psdController = TextEditingController();
  final confirmPsdController = TextEditingController();

  final _visiblePsd = false.obs;
  final _confirmVisiblePsd = false.obs;

  // ------- Getters
  bool get visiblePsd => _visiblePsd.value;
  bool get confirmVisiblePsd => _confirmVisiblePsd.value;

  // -------
  void toggleVisiblePsd() => _visiblePsd.value = !_visiblePsd.value;
  void toggleConfirmVisiblePsd() =>
      _confirmVisiblePsd.value = !_confirmVisiblePsd.value;

  // ------- validators
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

  String? validatePsdConfirmPassword(String? confirmPsd) {
    final isValid = validateEmptyField(confirmPsd);
    if (isValid == null) {
      if (confirmPsd!.length < 8) {
        return incorrectPasswordLength;
      } else if (psdController.text != confirmPsdController.text) {
        return incorrectPasswords;
      }
    } else {
      return requiredFiled;
    }
  }

  Future<void> signupPressed() async {
    Fimber.i('-');
    final valid = formKey.currentState?.validate();
    if (valid != null) {
      if (valid) {
        final name = userNameController.text;
        final phone = phoneController.text;
        final password = psdController.text;
        final confirmPassword = confirmPsdController.text;
        final userBody = UserRegisterBody(
          name: name,
          phone: phone,
          password: password,
          confirmPassword: confirmPassword,
        );
        try {
          startLoading();
          final user = await signupService.registerCall(userBody);
          if (user != null) {
            Fimber.i('user not null');
            await saveUserData(user);
            stopLoading();
            goHome();
          } else {
            stopLoading();
          }
          Fimber.i('aftercall');
        } catch (e) {
          Fimber.i('catch $e');
        }
      }
    }
  }

  Future<void> saveUserData(RegisterUser user) async {
    await Get.find<StorageService>().setIsFb(false);
    await Get.find<StorageService>().setUserData(user);
  }

  Future<void> goHome() async => await Get.offAllNamed(homeScreen);

  @override
  void dispose() {
    userNameController.dispose();
    phoneController.dispose();
    psdController.dispose();
    confirmPsdController.dispose();
    super.dispose();
  }
}
