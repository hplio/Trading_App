import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_app/common/add_to_wishlist/controller/ficon_controller.dart';
import 'package:trading_app/constants/colors.dart';

class FIcon extends StatelessWidget {
  const FIcon({super.key, required this.stockId});

  final String stockId;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FIconController());
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Obx(
      () => IconButton(
        onPressed: ()=>controller.toggleFavouriteStock(stockId),
        icon: Icon(
          controller.isFavourite(stockId) ? Icons.check : Icons.add,
          color: controller.isFavourite(stockId)
              ? Colors.green
              : dark
                  ? TColor.white
                  : TColor.darkerGrey,
        ),
      ),
    );
  }
}
