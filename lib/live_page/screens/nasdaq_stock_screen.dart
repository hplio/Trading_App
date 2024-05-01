import 'package:flutter/material.dart';
import 'package:trading_app/live_page/widget/html_file_chart.dart';

class NasdaqScreen extends StatelessWidget {
  NasdaqScreen({super.key,required this.NasdaqStockNames, required this.NasdaqStockId});

  final List<String> NasdaqStockNames;

  final List<String> NasdaqStockId;

  // final List<String> NasdaqStockNames=['Amazon','Apple','Amd','Google','Intel','Meta','Microsoft','Netflix','Nvidia','Super Micro Computer','Walt Disney Company','AMC Entertainment Holdings','Micron Technology, Inc.','Taiwan Semicon. Ma. Comany Ltd.','Bank of America Corporation','JP Morgan Chase & Co.','Trump Media & Tech. Group Corp.','Adobe Inc.','Roku Inc.','Robinhood Market Inc.','Shopify Inc.'];

  // final List<String> NasdaqStockId=["NASDAQ:AMZN","NASDAQ:AAPL","NASDAQ:AMD","NASDAQ:GOOGL","NASDAQ:INTC","NASDAQ:META","NASDAQ:MSFT","NASDAQ:NFLX","NASDAQ:NVDA","NASDAQ:SMCI","NASDAQ:DIS","NASDAQ:AMC","NASDAQ:MU","NASDAQ:TSM","NASDAQ:BAC","NASDAQ:JPM","NASDAQ:DJT","NASDAQ:ADBE","NASDAQ:ROKU","NASDAQ:HOOD","NASDAQ:SQ"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        padding: EdgeInsets.all(2),
        child: Column(
          children: [
            Expanded(
            child: ListView.builder(
                itemCount: NasdaqStockNames.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: HTMLFileChart(
                        symbol: NasdaqStockId[index], stockName: NasdaqStockNames[index]),
                    onTap: () {
                      // Perform actions when a stock is tapped
              
                      String selectedStock = NasdaqStockNames[index];
                      String selectedId = NasdaqStockId[index];
              
                      print(
                          'Selected stock: $selectedStock - Price: $selectedId');
                    },
                  );
                  }),
          ),
        
              
              // HTMLFileChart(symbol: "NASDAQ:AMZN", stockName: "Amazon"),
              // HTMLFileChart(symbol: "NASDAQ:AAPL", stockName: "Apple"),
              // HTMLFileChart(symbol: "NASDAQ:AMD", stockName: "Amd"),
              // HTMLFileChart(symbol: "NASDAQ:GOOGL", stockName: "Google"),
              // HTMLFileChart(symbol: "NASDAQ:INTC", stockName: "Intel"),
              // HTMLFileChart(symbol: "NASDAQ:META", stockName: "Meta"),
              // HTMLFileChart(symbol: "NASDAQ:MSFT", stockName: "Microsoft"),
              // HTMLFileChart(symbol: "NASDAQ:NFLX", stockName: "Netflix"),
              // HTMLFileChart(symbol: "NASDAQ:NVDA", stockName: "Nvidia"),
              // HTMLFileChart(symbol: "NASDAQ:SMCI", stockName: "Super Micro Computer"),
              // HTMLFileChart(symbol: "NASDAQ:DIS", stockName: "Walt Disney Company"),
              // HTMLFileChart(symbol: "NASDAQ:AMC", stockName: "AMC Entertainment Holdings"),
              // HTMLFileChart(symbol: "NASDAQ:MU", stockName: "Micron Technology, Inc."),
              // HTMLFileChart(symbol: "NASDAQ:TSM", stockName: "Taiwan Semicon. Ma. Comany Ltd."),
              // HTMLFileChart(symbol: "NASDAQ:BAC", stockName: "Bank of America Corporation"),
              // HTMLFileChart(symbol: "NASDAQ:JPM", stockName: "JP Morgan Chase & Co."),
              // HTMLFileChart(symbol: "NASDAQ:DJT", stockName: "Trump Media & Tech. Group Corp."),
              // HTMLFileChart(symbol: "NASDAQ:ADBE", stockName: "Adobe Inc."),
              // HTMLFileChart(symbol: "NASDAQ:ROKU", stockName: "Roku Inc."),
              // HTMLFileChart(symbol: "NASDAQ:HOOD", stockName: "Robinhood Market Inc."),
              // HTMLFileChart(symbol: "NASDAQ:SQ", stockName: "Shopify Inc."),
              
          ],
        
        ),
      ), 
    );
  }
}