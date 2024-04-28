import 'package:flutter/material.dart';
import 'package:trading_app/live_page/widget/html_file_chart.dart';

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
                HTMLFileChart(fileName: "apple.html", stockName: "Apple"),
                HTMLFileChart(fileName: "amd.html", stockName: "Amd"),
                HTMLFileChart(fileName: "google.html", stockName: "Google"),
                HTMLFileChart(fileName: "meta.html", stockName: "Meta"),
                HTMLFileChart(fileName: "microsoft.html", stockName: "Microsoft"),
                HTMLFileChart(fileName: "netflix.html", stockName: "Netflix"),
                HTMLFileChart(fileName: "nvdia.html", stockName: "Nvidia"),
                HTMLFileChart(fileName: "tesla.html", stockName: "Tesla"),
            ],
          ),
        ),
      ), 
    );
  }
}