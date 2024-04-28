import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:csv/csv.dart';
import 'package:trading_app/common/custom_app_bar/custom_appbar.dart';
import 'package:trading_app/constants/size.dart';
import 'package:trading_app/live_page/controller/nse_controller.dart';
import 'package:trading_app/live_page/widget/dropdown_btn.dart';

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
      enablePinching: true,
      enableDoubleTapZooming: true,
      zoomMode: ZoomMode.x,
      enablePanning: true,
    );
    _loadCSVData();
    super.initState();
  }

  Future<void> _loadCSVData() async {
    try {
      final rawData = await rootBundle.loadString('Assets/csv/$csvfile');
      List<List<dynamic>> listData =
          const CsvToListConverter().convert(rawData);

      // Assuming the CSV columns are in the order: Date, Open, High, Low, Close
      for (var row in listData) {
        // print(row[1].runtimeType);
        final date = DateTime.parse(row[0]);
        final open = double.parse(row[1].toString());
        final high = double.parse(row[2].toString());
        final low = double.parse(row[3].toString());
        final close = double.parse(row[4].toString());
        // final open = row[1];
        // final high = row[2];
        // final low = row[3];
        // final close = row[4];

        _chartData.add(ChartData(date, open, high, low, close));
        setState(() {
          // Update state with loaded data
        });
      }
    } catch (e) {
      throw e.toString();
    }
  }

  bool rsiVisible = false;
  bool adVisible = false;
  bool atrVisible = false;
  bool smaVisible = false;
  bool emaVisible = false;
  bool macdVisible = false;
  bool stochasticVisible = false;
  bool tmaVisible = false;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NSEController());
    String selectedItem = 'SIMPLE';
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
              KDropdownBtn(
                list: [
                  selectedItem,
                  'AD',
                  'RSI',
                  'ATR',
                  'EMA',
                  'MACD',
                  'SMA',
                  'Stochastic',
                  'TMA'
                ],
                selectedItem: selectedItem,
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: KSizeScreen.getScreenHeight(context)*.78,
                child: Obx(
                  () => SfCartesianChart(
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
                          plotOffset: 3,
                          // numberFormat: NumberFormat.compact(),
                          majorGridLines: MajorGridLines(width: 0),
                          // opposedPosition: false,
                          isVisible: false,
                          name: 'yAxis3',
                          interval: 1,
                          minimum: -5,
                          maximum: 5),
                      NumericAxis(
                          // numberFormat: NumberFormat.compact(),
                          majorGridLines: MajorGridLines(width: 0),
                          // opposedPosition: false,
                          isVisible: false,
                          name: 'yAxis2',
                          interval: 100,
                          minimum: 1300,
                          maximum: 1400),
                      NumericAxis(
                          // numberFormat: NumberFormat.compact(),
                          majorGridLines: MajorGridLines(width: 0),
                          // opposedPosition: false,
                          isVisible: false,
                          name: 'yAxis4',
                          interval: 100,
                          minimum: -60,
                          maximum: 140)
                    ],
                    primaryXAxis: const DateTimeAxis(),
                    legend: const Legend(isVisible: true),
                    indicators: [
                      AccumulationDistributionIndicator<ChartData, DateTime>(
                        isVisible: controller.adVisible.value,
                        seriesName: 'CandleSeries',
                        yAxisName: 'yAxis1',
                      ),
                      RsiIndicator<dynamic, dynamic>(
                        isVisible: controller.rsiVisible.value,
                        period: 3,
                        seriesName: 'CandleSeries',
                        overbought: 70,
                        oversold: 30,
                        yAxisName: 'yAxis1',
                        signalLineColor: Colors.transparent,
                      ),
                      AtrIndicator<dynamic, dynamic>(
                        isVisible: controller.atrVisible.value,
                        period: 3,
                        seriesName: 'CandleSeries',
                        yAxisName: 'yAxis1',
                      ),
                      EmaIndicator<dynamic, dynamic>(
                        isVisible: controller.emaVisible.value,
                        seriesName: 'CandleSeries',
                      ),
                      MacdIndicator<dynamic, dynamic>(
                        isVisible: controller.macdVisible.value,
                        longPeriod: 5,
                        shortPeriod: 2,
                        seriesName: 'CandleSeries',
                        yAxisName: 'yAxis3',
                      ),
                      SmaIndicator<dynamic, dynamic>(
                        isVisible: controller.smaVisible.value,
                        seriesName: 'CandleSeries',
                        yAxisName: 'yAxis2',
                        valueField: 'close',
                      ),
                      StochasticIndicator<dynamic, dynamic>(
                        isVisible: controller.stochasticVisible.value,
                        seriesName: 'CandleSeries',
                        yAxisName: 'yAxis4',
                        kPeriod: 2,
                        dPeriod: 3,
                      ),
                      TmaIndicator<ChartData, dynamic>(
                        isVisible: controller.tmaVisible.value,
                        seriesName: 'CandleSeries',
                        yAxisName: 'yAxis2',
                        valueField: 'low',
                      ),
                    ],
                    tooltipBehavior: TooltipBehavior(enable: true),
                
                    series: <CartesianSeries>[
                      CandleSeries<ChartData, DateTime>(
                        enableTooltip: true,
                        dataSource: _chartData,
                        xValueMapper: (ChartData data, _) => data.x,
                        lowValueMapper: (ChartData data, _) => data.low,
                        highValueMapper: (ChartData data, _) => data.high,
                        openValueMapper: (ChartData data, _) => data.open,
                        closeValueMapper: (ChartData data, _) => data.close,
                        showIndicationForSameValues: true,
                        name: 'CandleSeries',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
