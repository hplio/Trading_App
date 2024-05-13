// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_app/live_page/controller/fav_controller.dart';
import 'package:trading_app/live_page/widget/html_file_chart.dart';

class NasdaqScreen extends StatelessWidget {
  const NasdaqScreen(
      {super.key, required this.NasdaqStockNames, required this.NasdaqStockId});

  final List<String> NasdaqStockNames;

  final List<String> NasdaqStockId;

  @override
  Widget build(BuildContext context) {
    final List nasdaqList = <String>[
      'Assets/images/nasdaq/images.png',
      'Assets/images/nasdaq/apple.png',
      'Assets/images/nasdaq/download (4).png',
      'Assets/images/nasdaq/google.png',
      'Assets/images/nasdaq/intrel.png',
      'Assets/images/nasdaq/meta.jpeg',
      'Assets/images/nasdaq/microsoft.png',
      'Assets/images/nasdaq/netflix.png',
      'Assets/images/nasdaq/nvidia.png',
      'Assets/images/nasdaq/micron.png',
      'Assets/images/nasdaq/disney.png',
      'Assets/images/nasdaq/amc.png',
      'Assets/images/nasdaq/micron.png',
      'Assets/images/nasdaq/taivan.png',
      'Assets/images/nasdaq/bankOfAmerica.png',
      'Assets/images/nasdaq/jpMorgan.png',
      'Assets/images/nasdaq/trum.jpeg',
      'Assets/images/nasdaq/adobe.png',
      'Assets/images/nasdaq/roku.png',
      'Assets/images/nasdaq/robinhood.png',
      'Assets/images/nasdaq/robinhood.png',
      'Assets/images/nasdaq/sopyfi.png',
    ];
    
    final controller = Get.put(FavIcon());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: NasdaqStockNames.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: HTMLFileChart(
                        showImage: true,
                            assetName: nasdaqList[index],
                        symbol: NasdaqStockId[index],
                        stockName: NasdaqStockNames[index],
                        iconBtn: Obx(
                          () => IconButton(
                            onPressed: () {
                              controller.addNasdaqIdAndName(
                                NasdaqStockId[index],
                                NasdaqStockNames[index],
                              );
                              controller.nasdaqStockL[index] =
                                  !controller.nasdaqStockL[index];
                            },
                            icon: controller.nasdaqStockL[index]
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
