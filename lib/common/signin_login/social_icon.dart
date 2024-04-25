import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_app/constants/colors.dart';
import 'package:trading_app/login_page/controller/login_controller.dart';

class SocialIcon extends StatelessWidget {
  const SocialIcon({
    super.key,
    required this.imgString,
    this.onTap,
    this.addOnPress=false,
  });

  final String imgString;
  final void Function()? onTap;
  final bool? addOnPress;
  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    final controller = Get.put(LoginController());
    return GestureDetector(
      onTap: addOnPress!?onTap:() => controller.signInWithGoole(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
              color: dark ? TColor.lightGrey.withOpacity(.5) : TColor.grey),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Image(
            image: AssetImage(
              imgString,
            ),
          ),
        ),
      ),
    );
  }
}
