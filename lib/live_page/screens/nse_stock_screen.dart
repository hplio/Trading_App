import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trading_app/live_page/widget/nse_stock.dart';

class NseScreen extends StatelessWidget {

  final List<String> stockNames;
  final List<String> stockId;

  NseScreen({super.key,required this.stockNames, required this.stockId});



  // final List<String> stockNames = [
  //   "Adani Port",
  //   "Axis Bank",
  //   "Coal India",
  //   "ICICI Bank",
  //   "ITC",
  //   "Power Grid",
  //   "Tata Motors",
  //   "Tata Steel",
  //   "TCS",
  //   "Yesbank",
  //   "Yatra",
  //   "Titan",
  //   "TideWater",
  //   "TFCILTD",
  //   "Tata Power",
  //   "Tata Chemicals ltd.",
  //   "Aditya Birla",
  //   "Ongc",
  //   "Oil India ltd.",
  //   "Zomato"
  // ];
  // // Example list of stock names
  // final List<String> stockId = [
  //   "NSE_EQ|INE742F01042",
  //   "NSE_EQ|INE238A01034",
  //   "NSE_EQ|INE522F01014",
  //   "NSE_EQ|INE090A01021",
  //   "NSE_EQ|INE154A01025",
  //   "NSE_EQ|INE752E01010",
  //   "NSE_EQ|INE155A01022",
  //   "NSE_EQ|INE081A01020",
  //   "NSE_EQ|INE467B01029",
  //   "NSE_EQ|INE528G01035",
  //   "NSE_EQ|INE0JR601024",
  //   "NSE_EQ|INE280A01028",
  //   "NSE_EQ|INE484C01030",
  //   "NSE_EQ|INE305A01015",
  //   "NSE_EQ|INE245A01021",
  //   "NSE_EQ|INE092A01019",
  //   "NSE_EQ|INE674K01013",
  //   "NSE_EQ|INE213A01029",
  //   "NSE_EQ|INE274J01014",
  //   "NSE_EQ|INE758T01015"
  // ]; // Example list of stock prices

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(2),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: stockNames.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: NSEStock(
                          stock: stockId[index], stockName: stockNames[index]),
                      onTap: () {
                        // Perform actions when a stock is tapped

                        String selectedStock = stockNames[index];
                        String selectedId = stockId[index];

                        print(
                            'Selected stock: $selectedStock - Price: $selectedId');
                      },
                    );
                    // Column(
                    //   children: [
                    //       NSEStock(stock: "NSE_EQ|INE742F01042", stockName: "Adani Port"),
                    //       NSEStock(stock: "NSE_EQ|INE238A01034", stockName: "Axis Bank"),
                    //       NSEStock(stock: "NSE_EQ|INE522F01014", stockName: "Coal India"),
                    //       NSEStock(stock: "NSE_EQ|INE090A01021", stockName: "ICICI Bank"),
                    //       NSEStock(stock: "NSE_EQ|INE154A01025", stockName: "ITC"),
                    //       NSEStock(stock: "NSE_EQ|INE752E01010", stockName: "Power Grid"),
                    //       NSEStock(stock: "NSE_EQ|INE155A01022", stockName: "Tata Motors"),
                    //       NSEStock(stock: "NSE_EQ|INE081A01020", stockName: "Tata Steel"),
                    //       NSEStock(stock: "NSE_EQ|INE467B01029", stockName: "TCS"),
                    //       NSEStock(stock: "NSE_EQ|INE528G01035", stockName: "Yesbank"),
                    //       NSEStock(stock: "NSE_EQ|INE0JR601024", stockName: "Yatra"),
                    //       NSEStock(stock: "NSE_EQ|INE280A01028", stockName: "Titan"),
                    //       NSEStock(stock: "NSE_EQ|INE484C01030", stockName: "TideWater"),
                    //       NSEStock(stock: "NSE_EQ|INE305A01015", stockName: "TFCILTD"),
                    //       NSEStock(stock: "NSE_EQ|INE245A01021", stockName: "Tata Power"),
                    //       NSEStock(stock: "NSE_EQ|INE092A01019", stockName: "Tata Chemicals ltd."),
                    //       NSEStock(stock: "NSE_EQ|INE674K01013", stockName: "Aditya Birla"),
                    //       NSEStock(stock: "NSE_EQ|INE213A01029", stockName: "Ongc"),
                    //       NSEStock(stock: "NSE_EQ|INE274J01014", stockName: "Oil India ltd."),
                    //       NSEStock(stock: "NSE_EQ|INE758T01015", stockName: "Zomato"),
                    //   ],
                    // ),
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
