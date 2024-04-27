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

  const CandlestickChart({super.key, required this.csvfile});

  @override
  _CandlestickChartState createState() => _CandlestickChartState();
}

class _CandlestickChartState extends State<CandlestickChart> {
 final List<ChartData> _chartData = [];
  late ZoomPanBehavior _zoomPanBehavior;
  String csvfile = '';

  @override
  void initState() {
    csvfile = widget.csvfile;
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
        // axes: [CategoryAxis()],
        axes: const <ChartAxis>[
              NumericAxis(
                // numberFormat: NumberFormat.compact(),
                majorGridLines: MajorGridLines(width: 0),
                // opposedPosition: false,
                isVisible: false,
                name: 'yAxis1',
                interval: 100,
                minimum: -10,
                maximum: 90),
                NumericAxis(
                // numberFormat: NumberFormat.compact(),
                majorGridLines: MajorGridLines(width: 0),
                // opposedPosition: false,
                isVisible: false,
                name: 'yAxis2',
                interval: 100,
                minimum: 1300,
                maximum: 1400)
                ],
        // primaryYAxis: const NumericAxis(
        //   // rangePadding: ChartRangePadding.auto,
        //   minimum: 1000,
        //   maximum: 1200,
        // ),
        // enableSideBySideSeriesPlacement: true,
        primaryXAxis: const DateTimeAxis(
            // autoScrollingDelta: 7
            ),
        legend: const Legend(isVisible: true),
        indicators: [
          // AccumulationDistributionIndicator<ChartData, DateTime>(
          //   // name: 'CandleSeries',
          //   isVisible: true,
          //   // dataSource: _chartData,
          //   seriesName: 'CandleSeries',
          //   // xValueMapper: (ChartData data, _) => data.x,
          //   // lowValueMapper: (ChartData data, _) => data.low,
          //   // highValueMapper: (ChartData data, _) => data.high,
          //   // // openValueMapper: (ChartData data, _) => data.open,
          //   // closeValueMapper: (ChartData data, _) => data.close,
          //   // xAxisName: 'Time',
          //   yAxisName: 'yAxis1',
          // ),
          RsiIndicator<dynamic, dynamic>(
            period: 3,
            seriesName: 'CandleSeries',
            overbought: 70,
            oversold: 30,
            yAxisName: 'yAxis1',
            signalLineColor: Colors.transparent
            // xValueMapper: (ChartData data, _) => data.x,
            // lowValueMapper: (ChartData data, _) => data.low,
            // highValueMapper: (ChartData data, _) => data.high,
            // // openValueMapper: (ChartData data, _) => data.open,
            // closeValueMapper: (ChartData data, _) => data.close,
          )
        
        ],
        // tooltipBehavior: TooltipBehavior(enable: true),
        // indicators: [
        //   // EmaIndicator<dynamic, dynamic>(
        //   //         seriesName: 'CandleSeries')
        //   RsiIndicator<ChartData, DateTime>(
        //     period: 3,
        //     seriesName: 'CandleSeries',
        //     overbought: 70,
        //     oversold: 30,
        //     // xValueMapper: (ChartData data, _) => data.x,
        //     // lowValueMapper: (ChartData data, _) => data.low,
        //     // highValueMapper: (ChartData data, _) => data.high,
        //     // // openValueMapper: (ChartData data, _) => data.open,
        //     // closeValueMapper: (ChartData data, _) => data.close,
        //   )
        // ],
        series: <CartesianSeries>[
          CandleSeries<ChartData, DateTime>(
            // enableTooltip: true,
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
            showIndicationForSameValues: true,
            // xAxisName: 'Time',
            // yAxisName: 'Price',
            // yAxisName: 'yAxis2',
          
            name: 'CandleSeries',
          ),
        ],
      ),
    );
  }
}
