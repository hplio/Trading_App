import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_app/live_page/controller/fav_controller.dart';
import 'package:trading_app/live_page/widget/nse_stock.dart';

class NseScreen extends StatelessWidget {
  final List<String> stockNames;
  final List<String> stockId;

  const NseScreen({super.key, required this.stockNames, required this.stockId});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavIcon());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: stockNames.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: NSEStock(
                        stock: stockId[index],
                        stockName: stockNames[index],
                        iconButton: Obx(
                          () => IconButton(
                            onPressed: () {
                              controller.addStockIdAndName(
                                stockId[index],
                                stockNames[index],
                              );
                              controller.stockL[index] =
                                  !controller
                                      .stockL[index];
                            },
                            icon: controller.stockL[index]
                                ? const Icon(
                                    Icons.check,
                                    color: Colors.green,
                                  )
                                : const Icon(
                                    Icons.add,
                                  ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
