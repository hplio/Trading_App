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
    final controller = Get.put(FavIcon());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: NasdaqStockNames.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: HTMLFileChart(
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
