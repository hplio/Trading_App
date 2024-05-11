import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_app/live_page/controller/fav_controller.dart';
import 'package:trading_app/live_page/widget/html_file_chart.dart';

class WishListNasdaqPage extends StatelessWidget {
  const WishListNasdaqPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavIcon());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: controller.nasdaqStockId.length,
              itemBuilder: (_, int index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: HTMLFileChart(
                    stockName: controller.nasdaqStockName[index],
                    symbol: controller.nasdaqStockId[index],
                    iconBtn: const SizedBox(
                      height: 45,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
