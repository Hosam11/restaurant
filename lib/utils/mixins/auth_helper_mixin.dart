import 'package:fimber/fimber.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:restaurant/constants/strings.dart';
import 'package:restaurant/routes.dart';
import 'package:restaurant/utils/dialog/dialogs.dart';
import 'package:restaurant/utils/services/storage_service.dart';
import 'package:get/get.dart';

mixin AuthHelperMixin {
  String? validateEmptyField(String? value) {
    if (value == null) {
      return requiredFiled;
    } else if (value.isEmpty) {
      return requiredFiled;
    } else {
      return null;
    }
  }

  String? validUserName(String? userName) {
    final isValid = validateEmptyField(userName);
    if (isValid == null) {
      // Fimber.i('userName= $userName');
      if (userName!.length < 3) {
        return incorrectUsernameLength;
      }
    } else {
      return requiredFiled;
    }
  }

  String? validatePhone(String? phone) {
    final isValid = validateEmptyField(phone);
    // Fimber.i('phone= $phone');
    if (isValid == null) {
      if (phone!.length != 11) {
        return incorrectMobileLength;
      }
    } else {
      return requiredFiled;
    }
  }

  Future<void> continueWithFacebook() async {
    // by default we request the email and the public profile
    final LoginResult loginRes = await FacebookAuth.i.login();
    // or FacebookAuth.i.login()
    Fimber.i('fbStatus ${loginRes.status}');
    Fimber.i('fbMsg ${loginRes.message}');
    switch (loginRes.status) {
      case LoginStatus.success:
        // you are logged
        final accessToken = loginRes.accessToken!;
        Fimber.i('accessToken= ${accessToken.token}');
        final userData = await FacebookAuth.instance.getUserData();
        await saveData(userData);
        Get.offAndToNamed(homeScreen);
        break;
      case LoginStatus.cancelled:
      case LoginStatus.failed:
        await showInfoDialog(errorTitle, loginRes.message);
        break;
      case LoginStatus.operationInProgress:
        break;
    }
  }

  Future<void> saveData(Map<String, dynamic> userData) async {
    final name = userData['name'];
    Fimber.i('fbName= $name');
    await Get.find<StorageService>().setIsFb(true);
    Get.find<StorageService>().setUserName(name);
  }
}
