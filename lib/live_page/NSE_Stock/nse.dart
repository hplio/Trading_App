import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:csv/csv.dart';
import 'package:trading_app/common/custom_app_bar/custom_appbar.dart';
import 'package:trading_app/constants/colors.dart';
import 'package:trading_app/constants/size.dart';

class ChartData {
  final DateTime x;
  final double open;
  final double high;
  final double low;
  final double close;

  ChartData(this.x, this.open, this.high, this.low, this.close);
}

class CandlestickChart extends StatefulWidget {
  const CandlestickChart(
      {super.key, required this.csvfile, required this.stockName});

  final String csvfile;
  final String stockName;

  @override
  State<CandlestickChart> createState() => _CandlestickChartState();
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
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: CAppBar(
        title: Text(
          widget.stockName,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            children: [
              SizedBox(
                height: KSizeScreen.getScreenHeight(context) * .6,
                child: SfCartesianChart(
                  zoomPanBehavior: _zoomPanBehavior,
                  backgroundColor: dark ? TColor.black : TColor.white,
                  enableAxisAnimation: true,
                  primaryXAxis: const DateTimeAxis(autoScrollingDelta: 7),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
