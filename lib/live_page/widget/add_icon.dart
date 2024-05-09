import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_app/live_page/controller/fav_controller.dart';

class AddIconBtn extends StatelessWidget {
  const AddIconBtn({
    super.key,
    required this.stock,
    required this.stockName, this.onPressed,
  });

  final String stock;
  final String stockName;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavIcon());
    return Obx(
      () => IconButton(
        onPressed: onPressed,
        icon: controller.isFav.value
            ? const Icon(
                Icons.check,
                color: Colors.green,
              )
            : const Icon(
                Icons.add,
              ),
      ),
    );
  }
}
