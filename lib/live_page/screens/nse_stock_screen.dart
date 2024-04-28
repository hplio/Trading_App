import 'package:flutter/material.dart';
import 'package:trading_app/live_page/widget/nse_stock.dart';

class NseScreen extends StatelessWidget {
  const NseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            children: [
                NSEStock(fileName: "adaniport.csv", stockName: "Adani Port"),
                NSEStock(fileName: "axisbank.csv", stockName: "Axis Bank"),
                NSEStock(fileName: "coalindia.csv", stockName: "Coal India"),
                NSEStock(fileName: "icicibank.csv", stockName: "ICICI Bank"),
                NSEStock(fileName: "itc.csv", stockName: "ITC"),
                NSEStock(fileName: "power_grid.csv", stockName: "Power Grid"),
                NSEStock(fileName: "tatamotors.csv", stockName: "Tata Motors"),
                NSEStock(fileName: "tatasteel.csv", stockName: "Tata Steel"),
                NSEStock(fileName: "TCS-2.csv", stockName: "TCS"),
                NSEStock(fileName: "wipro.csv", stockName: "Wipro"),
            ],
          ),
        ),
      ),
    );
  }
}
