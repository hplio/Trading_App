import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HTTP GET Example',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> fetchData() async {
    String url = "https://api.upstox.com/v2/historical-candle/NSE_EQ%7CINE467B01029/1minute/2024-03-11/2024-02-26";

    try {

      
        // final open = row[1];
        // final high = row[2];
        // final low = row[3];
        // final close = row[4];
      final response = await http.get(Uri.parse(url));
      
      if (response.statusCode == 200) {
        // Request successful, process response here
        final responseData = json.decode(response.body);
        final authToken = responseData['data']; // Assuming the token key in the response JSON is 'token'
        final candle = authToken['candles'];
        final a=candle.toString();
        print('Response data:${responseData}');

        // List<List<dynamic>> listData =
        //   const CsvToListConverter().convert(rawData);

      // Assuming the CSV columns are in the order: Date, Open, High, Low, Close
      // for (var row in listData) {
      //   // print(row[1].runtimeType);
      //   final date = DateTime.parse(row[0]);
      //   final open = double.parse(row[1].toString());
      //   final high = double.parse(row[2].toString());
      //   final low = double.parse(row[3].toString());
      //   final close = double.parse(row[4].toString());
        // Fetch only the first column
  // List<dynamic> Date = candle.map((row) => row[0]).toList();
  // List<dynamic> Open = candle.map((row) => row[1]).toList();
  // List<dynamic> High = candle.map((row) => row[2]).toList();
  // List<dynamic> Low = candle.map((row) => row[3]).toList();
  // List<dynamic> Close = candle.map((row) => row[4]).toList();
  // List<dynamic> Volumn = candle.map((row) => row[5]).toList();

  // Print the first column
  // print('open column: $Open');
        // print('Response: ${response.body}');
      } else {
        // Request failed
        print('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      // Error during request
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HTTP GET Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: fetchData,
          child: Text('Fetch Data'),
        ),
      ),
    );
  }
}
