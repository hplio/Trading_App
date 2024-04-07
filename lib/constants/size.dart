import 'package:flutter/material.dart';

class KSizeScreen {
  KSizeScreen._();

  static double getScreenHeight(context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return screenHeight;
  }

  static Size getScreenSize(context) {
    return MediaQuery.of(context).size;
  }

  static double getScreenWidth(context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth;
  }

  static double getPixal(context) {
    return MediaQuery.of(context!).devicePixelRatio;
  }
}
