// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:csv/csv.dart';

// void main() {
//   runApp(const MyApp());
// }

class ChartData {
  final DateTime x;
  final double open;
  final double high;
  final double low;
  final double close;

  ChartData(this.x, this.open, this.high, this.low, this.close);
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(title: const Text('Candlestick Chart Example')),
//         body: CandlestickChart(),
//       ),
//     );
//   }
// }

class CandlestickChart extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final csvfile;

  const CandlestickChart({super.key,required  this.csvfile});

  @override
  _CandlestickChartState createState() => _CandlestickChartState();
}

class _CandlestickChartState extends State<CandlestickChart> {
  List<ChartData> _chartData = [];
  late ZoomPanBehavior _zoomPanBehavior;
  String csvfile='';

  @override
  void initState() {
    csvfile=widget.csvfile;
    _zoomPanBehavior = ZoomPanBehavior(
      // Enables pinch zooming
      enablePinching: true,
      enableDoubleTapZooming: true,
      zoomMode: ZoomMode.x,
      enablePanning: true,
    );

    super.initState();
    _loadCSVData();
  }

  Future<void> _loadCSVData() async {
    final rawData = await rootBundle.loadString('Assets/csv/$csvfile');
    List<List<dynamic>> listData = const CsvToListConverter().convert(rawData);

    // Assuming the CSV columns are in the order: Date, Open, High, Low, Close
    for (var row in listData) {
      // print(row[1].runtimeType);
      final date = DateTime.parse(row[0]);
      final open = row[1];
      final high = row[2];
      final low = row[3];
      final close = row[4];

      _chartData.add(ChartData(date, open, high, low, close));
    }

    setState(() {
      // Update state with loaded data
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SfCartesianChart(
        zoomPanBehavior: _zoomPanBehavior,
        enableAxisAnimation: true,
        primaryXAxis: const DateTimeAxis(
          autoScrollingDelta: 7
        ),
        legend: const Legend(isVisible: true),
        
        tooltipBehavior: TooltipBehavior(enable: true),
        // indicators: [
        //   // EmaIndicator<dynamic, dynamic>(
        //   //         seriesName: 'CandleSeries')
        //   RsiIndicator<dynamic, dynamic>(
        //     period: 3,
        //     seriesName: 'CandleSeries',
        //     overbought: 70,
        //     oversold: 30)
        // ],
        series: <CartesianSeries>[
          CandleSeries<ChartData, DateTime>(
            // enableTooltip: true,
            name: 'CandleSeries',
            // trendlines: [Trendline(
            //   type: TrendlineType.movingAverage, 
            //                     color: Colors.blue
            // )],
            dataSource: _chartData,
            xValueMapper: (ChartData data, _) => data.x,
            lowValueMapper: (ChartData data, _) => data.low,
            highValueMapper: (ChartData data, _) => data.high,
            openValueMapper: (ChartData data, _) => data.open,
            closeValueMapper: (ChartData data, _) => data.close,
          ),
        ],
      ),
    );
  }
}
