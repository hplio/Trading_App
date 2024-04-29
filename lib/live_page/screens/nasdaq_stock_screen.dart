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
                HTMLFileChart(symbol: "NASDAQ:AMZN", stockName: "Amazon"),
                HTMLFileChart(symbol: "NASDAQ:AAPL", stockName: "Apple"),
                HTMLFileChart(symbol: "NASDAQ:AMD", stockName: "Amd"),
                HTMLFileChart(symbol: "NASDAQ:GOOGL", stockName: "Google"),
                HTMLFileChart(symbol: "NASDAQ:INTC", stockName: "Intel"),
                HTMLFileChart(symbol: "NASDAQ:META", stockName: "Meta"),
                HTMLFileChart(symbol: "NASDAQ:MSFT", stockName: "Microsoft"),
                HTMLFileChart(symbol: "NASDAQ:NFLX", stockName: "Netflix"),
                HTMLFileChart(symbol: "NASDAQ:NVDA", stockName: "Nvidia"),
                HTMLFileChart(symbol: "NASDAQ:SMCI", stockName: "Super Micro Computer"),
                HTMLFileChart(symbol: "NASDAQ:DIS", stockName: "Walt Disney Company"),
                HTMLFileChart(symbol: "NASDAQ:AMC", stockName: "AMC Entertainment Holdings"),
                HTMLFileChart(symbol: "NASDAQ:MU", stockName: "Micron Technology, Inc."),
                HTMLFileChart(symbol: "NASDAQ:TSM", stockName: "Taiwan Semicon. Ma. Comany Ltd."),
                HTMLFileChart(symbol: "NASDAQ:BAC", stockName: "Bank of America Corporation"),
                HTMLFileChart(symbol: "NASDAQ:JPM", stockName: "JP Morgan Chase & Co."),
                HTMLFileChart(symbol: "NASDAQ:DJT", stockName: "Trump Media & Tech. Group Corp."),
                HTMLFileChart(symbol: "NASDAQ:ADBE", stockName: "Adobe Inc."),
                HTMLFileChart(symbol: "NASDAQ:ROKU", stockName: "Roku Inc."),
                HTMLFileChart(symbol: "NASDAQ:HOOD", stockName: "Robinhood Market Inc."),
                HTMLFileChart(symbol: "NASDAQ:SQ", stockName: "Shopify Inc."),
                
            ],
          ),
        ),
      ), 
    );
  }
}