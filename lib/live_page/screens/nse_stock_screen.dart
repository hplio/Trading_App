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
    final List nseList = <String>[
      'Assets/images/nse/Adani.png',
      'Assets/images/nse/axis.png',
      'Assets/images/nse/coal india.png',
      'Assets/images/nse/icici.png',
      'Assets/images/nse/ITC.png',
      'Assets/images/nse/power grid.png',
      'Assets/images/nse/tata motors.png',
      'Assets/images/nse/tata steel.png',
      'Assets/images/nse/tcs.png',
      'Assets/images/nse/yes bank.png',
      'Assets/images/nse/yatra.png',
      'Assets/images/nse/Titan.png',
      'Assets/images/nse/Tidewater.png',
      'Assets/images/nse/TFCILTD.jpeg',
      'Assets/images/nse/tataSteel.png',
      'Assets/images/nse/tataSteel.png',
      'Assets/images/nse/adityaBrila.png',
      'Assets/images/nse/ongc.png',
      'Assets/images/nse/oilIndia.png',
      'Assets/images/nse/Zomato.png',
    ];
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
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: NSEStock(
                        showImage: true,
                        assetName: nseList[index],
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
                                  !controller.stockL[index];
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
