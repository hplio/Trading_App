import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  void nextPage() {
    if (curruntPage.value == 2) {
      Get.to(const LoginPage());
    } else {
      pageController.jumpToPage(curruntPage.value + 1);
    }
  }
}
