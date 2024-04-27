import 'package:flutter/material.dart';
import 'package:trading_app/live_page/widget/csv_list_stock.dart';

class NasdaqScreen extends StatelessWidget {
  const NasdaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            children: [
                ListViaCsv(fileName: "apple.html", stockName: "Apple"),
                ListViaCsv(fileName: "amd.html", stockName: "Amd"),
                ListViaCsv(fileName: "google.html", stockName: "Google"),
                ListViaCsv(fileName: "meta.html", stockName: "Meta"),
                ListViaCsv(fileName: "microsoft.html", stockName: "Microsoft"),
                ListViaCsv(fileName: "netflix.html", stockName: "Netflix"),
                ListViaCsv(fileName: "nvdia.html", stockName: "Nvidia"),
                ListViaCsv(fileName: "tesla.html", stockName: "Tesla"),
            ],
          ),
        ),
      ), 
    );
  }
}