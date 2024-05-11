import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_app/live_page/controller/fav_controller.dart';
import 'package:trading_app/live_page/widget/nse_stock.dart';

class WishListNsePage extends StatelessWidget {
  const WishListNsePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavIcon());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: controller.stockId.length,
                  itemBuilder: (_, int count) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: NSEStock(
                        stock: controller.stockId[count],
                        stockName: controller.stockName[count],
                        iconButton: const SizedBox(
                          height: 45,
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
