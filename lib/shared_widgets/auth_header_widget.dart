import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/constants/assets.dart';
import 'package:restaurant/constants/colors.dart';
import 'package:get/get.dart';

class AuthHeaderWidget extends StatelessWidget {
  const AuthHeaderWidget({Key? key, required this.title, this.isBackButton})
      : super(key: key);
  final String title;
  final bool? isBackButton;
  @override
  Widget build(BuildContext context) {
    final isPortrait = context.isPortrait;
    final size = Get.size;
    final logoDimension = isPortrait ? size.width * .6 : size.height * .6;
    final halfScreenSize = size.width / 2;
    final newCalc = (halfScreenSize - logoDimension / 2).round() + 0.0;
    Fimber.i('top= ${context.mediaQueryPadding.top}');
    return Stack(
      children: [
        Image.asset(
          backgroundImg,
          fit: BoxFit.fill,
          width: double.infinity,
          height: isPortrait ? size.width * .9 : size.height * .9,
        ),
        Padding(
          padding: EdgeInsets.only(top: context.mediaQueryPadding.top),
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 22.0, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey[300]!.withOpacity(.9),
              ),
              child: Text(
                title,
                style: const TextStyle(color: kBlackColor),
              ),
            ),
          ),
        ),
        if (isBackButton != null)
          Padding(
            padding: EdgeInsets.only(top: context.mediaQueryPadding.top * .59),
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.arrow_back_ios, size: 15),
                onPressed: () => Get.back(),
              ),
            ),
          ),
        Positioned(
          bottom: -1,
          left: newCalc,
          // alignment: Alignment.bottomLeft,
          child: Image.asset(
            logoImg,
            fit: BoxFit.cover,
            width: logoDimension,
            height: logoDimension,
          ),
        ),
      ],
    );
  }
}
