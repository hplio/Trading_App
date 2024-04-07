import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:trading_app/constants/colors.dart';
import 'package:trading_app/onbording_page/controllers/onbording_controller.dart';

class OnBordingArrowNav extends StatelessWidget {
  const OnBordingArrowNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put((OnBordingController()));
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: dark ? TColor.primary : TColor.dark,
          side: BorderSide(color: dark ? TColor.primary : TColor.black),
        ),
        onPressed:controller.nextPage,
        child: const Icon(
          Iconsax.arrow_right_3_copy,
          color: TColor.white,
        ),);
  }
}
