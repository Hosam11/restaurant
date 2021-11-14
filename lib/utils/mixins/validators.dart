import 'package:restaurant/constants/strings.dart';

mixin ValidatorsMixin {
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
}
