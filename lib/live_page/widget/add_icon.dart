import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:trading_app/live_page/controller/fav_controller.dart';

class AddIconBtn extends StatelessWidget {
  const AddIconBtn({
    super.key,
    required this.stock,
    required this.stockName,
    this.onPressed,
    this.icon,
  });

  final String stock;
  final String stockName;
  final void Function()? onPressed;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(FavIcon());
    return Obx(
      () => IconButton(
        onPressed: onPressed,
        icon: icon!,
      ),
    );
  }
}
