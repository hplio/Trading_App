import 'package:flutter/material.dart';
import 'package:trading_app/common/img_container/circuler_img_container.dart';
import 'package:trading_app/constants/colors.dart';

class ShowAppDialog {
  static void showDialog(BuildContext context) {
    bool dark = Theme.of(context).brightness == Brightness.dark;
    return showAboutDialog(
      applicationIcon: const KCirculerImage(
        imgString: 'Assets/images/logo/app_icon.jpg',
      ),
      applicationVersion: '1.0.0',
      context: context,
      applicationName: 'Trade Analyze',
      barrierColor:
          dark ? TColor.black.withOpacity(.3) : TColor.white.withOpacity(.3),
    );
  }
}
