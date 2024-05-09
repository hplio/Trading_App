// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:trading_app/live_page/widget/html_file_chart.dart';

class NasdaqScreen extends StatelessWidget {
  const NasdaqScreen(
      {super.key, required this.NasdaqStockNames, required this.NasdaqStockId});

  final List<String> NasdaqStockNames;

  final List<String> NasdaqStockId;

  @override
  Widget build(BuildContext context) {
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
                          stockName: NasdaqStockNames[index]),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
