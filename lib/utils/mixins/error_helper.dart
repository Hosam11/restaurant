import 'package:restaurant/models/error/error_model.dart';

mixin ErrorHelperMixin {
  String getStringMsg(ErrorModel errorModel) {
    final errorMsgBuffer = StringBuffer();
    if (errorModel.mobile != null) {
      for (var e in errorModel.mobile!) {
        errorMsgBuffer.write('$e\n');
      }
    }
    if (errorModel.password != null) {
      for (var e in errorModel.password!) {
        errorMsgBuffer.write('$e\n');
      }
    }
    if (errorModel.name != null) {
      for (var e in errorModel.name!) {
        errorMsgBuffer.write('$e\n');
      }
    }
    if (errorModel.error != null) {
      errorMsgBuffer.write('${errorModel.error}\n');
    }
    return errorMsgBuffer.toString();
  }
}
