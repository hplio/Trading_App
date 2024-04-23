import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:trading_app/login_page/login_page.dart';

class OnBordingController extends GetxController {
  static OnBordingController get instance => Get.find();
  final pageController = PageController();
  Rx<int> curruntPage = 0.obs;
  void updatePageIndicator(int index) => curruntPage.value = index;
  dotNavigationClick(int index) {
    curruntPage.value = index;

    pageController.jumpToPage(index);
  }

  void nextPage() async {
    if (curruntPage.value == 2) {
      final storage = GetStorage();
      await storage.write('isFirstTime', false);
      Get.offAll(const LoginPage());
    } else {
      pageController.jumpToPage(curruntPage.value + 1);
    }
  }
}

// if (curruntPage.value == 2) {
//       final storage = GetStorage();
//       if (kDebugMode) {
//         print('======= CONTEROLER PAGE-2 ======');
//         print(storage.read('isFirstTime'));
//       }

//       storage.write('isFirstTime', false);
//       if (kDebugMode) {
//         print('======= CONTEROLER PAGE-2 ======');
//         print(storage.read('isFirstTime'));
//       }
//       Get.offAll(const LoginScreen());
//     } else {
//       pageController.jumpToPage(curruntPage.value + 1);
//     }