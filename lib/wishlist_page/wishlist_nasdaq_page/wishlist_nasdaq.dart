import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_app/live_page/controller/fav_controller.dart';
import 'package:trading_app/live_page/widget/html_file_chart.dart';

class WishListNasdaqPage extends StatelessWidget {
  const WishListNasdaqPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavIcon());
    // final List nseList = <String>[
    //   'Assets/images/nasdaq/images/png',
    //   'Assets/images/nasdaq/apple.png',
    //   'Assets/images/nasdaq/download (4).png',
    //   'Assets/images/nasdaq/google.png',
    //   'Assets/images/nasdaq/intrel.png',
    //   'Assets/images/nasdaq/meta.jpeg',
    //   'Assets/images/nasdaq/microsoft.png',
    //   'Assets/images/nasdaq/netflix.png',
    //   'Assets/images/nasdaq/nvidia.png',
    //   'Assets/images/nasdaq/micron.png',
    //   'Assets/images/nasdaq/disney.png',
    //   'Assets/images/nasdaq/amc.png',
    //   'Assets/images/nasdaq/micron.png',
    //   'Assets/images/nasdaq/taivan.png',
    //   'Assets/images/nasdaq/bankOfAmerica.png',
    //   'Assets/images/nasdaq/jpMorgan.png',
    //   'Assets/images/nasdaq/trum.jpeg',
    //   'Assets/images/nasdaq/adobe.png',
    //   'Assets/images/nasdaq/roku.png',
    //   'Assets/images/nasdaq/robinhood.png',
    //   'Assets/images/nasdaq/robinhood.png',
    //   'Assets/images/nasdaq/sopyfi.png',
    // ];
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
                    showImage: false,
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
