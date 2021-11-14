import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/constants/colors.dart';
import 'package:restaurant/constants/dimensions.dart';

startLoading() async => await Get.dialog(
      const Center(
        child: CircularProgressIndicator(
          color: kOrangeColor,
        ),
      ),
      barrierDismissible: false,
    );

stopLoading() => Get.back();

Future<void> showInfoDialog(String title, String? msg) async {
  return await Get.defaultDialog(
    title: title,
    titleStyle: const TextStyle(color: kOrangeColor),
    contentPadding: const EdgeInsets.all(mediumPadding),
    middleText: msg ?? '',
    radius: 15,
    titlePadding: const EdgeInsets.only(top: mediumPadding),
  );
}
