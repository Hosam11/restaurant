import 'package:flutter/material.dart';
import 'package:restaurant/constants/colors.dart';
import 'package:restaurant/constants/strings.dart';
import 'package:get/get.dart';
import 'package:restaurant/utils/services/storage_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 4.0),
              child: Text(
                welcome,
                style: TextStyle(fontSize: 14),
              ),
            ),
            const SizedBox(width: 8),
            Text(Get.find<StorageService>().userData?.name ?? ' ',
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: kOrangeColor,
      ),
    );
  }
}
