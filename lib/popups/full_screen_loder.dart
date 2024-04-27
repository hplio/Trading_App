import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_app/common/loader/animation_loader.dart';
import 'package:trading_app/constants/colors.dart';

class KFullScreenLoder {
  static void openLodingDialog(String taxt, String animation) {
    final bool dark = Theme.of(Get.context!).brightness == Brightness.dark;
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: dark ? TColor.dark : TColor.white,
                width: double.infinity,
                height: double.maxFinite,
                child:Column(
                  children: [
                    const SizedBox(
                      height: 250,
                    ),
                    KAnimationLoader(animation: animation, text: taxt,)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
