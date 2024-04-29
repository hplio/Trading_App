import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:csv/csv.dart';
import 'package:trading_app/common/custom_app_bar/custom_appbar.dart';
import 'package:trading_app/constants/size.dart';
// import 'package:trading_app/live_page/NSE_Stock/NSE_chart/chart_modal/chat_modal.dart';
// import 'package:trading_app/live_page/NSE_Stock/NSE_chart/sock_chart.dart';
import 'package:trading_app/live_page/controller/nse_controller.dart';
import 'package:trading_app/live_page/widget/dropdown_btn.dart';
import 'package:http/http.dart' as http;

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
      {super.key, required this.stock, required this.stockName});

  final String stock;
  final String stockName;

  @override
  State<CandlestickChart> createState() => _CandlestickChartState();
}

class _CandlestickChartState extends State<CandlestickChart> {
  final List<ChartData> _chartData = [];
  late ZoomPanBehavior _zoomPanBehavior;
  // String csvfile = '';

  @override
  void initState() {
    // csvfile = widget.csvfile;
    stock = widget.stock;
    _zoomPanBehavior = ZoomPanBehavior(
      enablePinching: true,
      enableDoubleTapZooming: true,
      zoomMode: ZoomMode.x,
      enablePanning: true,
    );
    // _loadCSVData();
    fetchData();
    super.initState();
  }

  // Future<void> _loadCSVData() async {
  //   try {
  //     final rawData = await rootBundle.loadString('Assets/csv/$csvfile');
  //     List<List<dynamic>> listData =
  //         const CsvToListConverter().convert(rawData);
  //     // print(listData);
  //     // Assuming the CSV columns are in the order: Date, Open, High, Low, Close
  //     for (var row in listData) {
  //       // print(row[1].runtimeType);
  //       final date = DateTime.parse(row[0]);
  //       final open = double.parse(row[1].toString());
  //       final high = double.parse(row[2].toString());
  //       final low = double.parse(row[3].toString());
  //       final close = double.parse(row[4].toString());
  //       // final open = row[1];
  //       // final high = row[2];
  //       // final low = row[3];
  //       // final close = row[4];
  //       _chartData.add(ChartData(date, open, high, low, close));
  //       setState(() {
  //         // Update state with loaded data
  //       });
  //     }
  //     print(_chartData);
  //   } catch (e) {
  //     throw e.toString();
  //   }
  // }
  var interval = '1minute';
  var stock;
  // var startDate='2024-02-20';
  // var endDate='2024-02-26';
  Future<void> fetchData() async {
    String url =
        "https://api.upstox.com/v2/historical-candle/$stock/$interval/${endDate.year}-0${endDate.month}-${endDate.day}/${startDate.year}-0${startDate.month}-${startDate.day}";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // Request successful, process response here
        final responseData = json.decode(response.body);
        final authToken = responseData[
            'data']; // Assuming the token key in the response JSON is 'token'
        final candle = authToken['candles'];
        // final a = candle.toString();
        // String dateTimeString = '2024-03-11T15:29:00+05:30';
        // var date = candle.map((row) => row[0]).toList();
        // var datetime;
        // List<String> time=[];
        // print(candle);

        for (var row in candle) {
          // print(row[1].runtimeType);
          final date = DateTime.parse(row[0]);
          final open = double.parse(row[1].toString());
          final high = double.parse(row[2].toString());
          final low = double.parse(row[3].toString());
          final close = double.parse(row[4].toString());

          _chartData.add(ChartData(date, open, high, low, close));

          setState(() {
            // Update state with loaded data
          });
        }

        print(_chartData);

        // print('Response data:${date}');
        // print('Response data:${a}');
        // Remove the timezone offset
        // int offsetIndex = date.lastIndexOf('+');
        // if (offsetIndex != -1) {
        //   date = date.substring(0, offsetIndex);
        // }
        // // Parse the string into a DateTime object
        // DateTime Date = DateTime.parse(date);
        // Fetch only the first column
        //       final Date = DateTime.parse(candle.map((row) => row[0]).toString());
        //       final Open = double.parse(candle.map((row) => row[1]).toString());
        //       final High = double.parse(candle.map((row) => row[2]).toString());
        //       final Low = double.parse(candle.map((row) => row[3]).toString());
        //       final Close = double.parse(candle.map((row) => row[4]).toString());
        //       final Volumn = candle.map((row) => row[5]).toList();
        // _chartData.add(ChartData(Date, Open, High, Low, Close));
        // Print the first column
        // print('open column: $a');
        // print('Response: ${response.body}');
      } else {
        print(url);
        // Request failed
        print('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      // Error during request
      print('Error: $e');
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

  // ignore: non_constant_identifier_names
  // List<TechnicalIndicator<dynamic, dynamic>> Indicator=[];

  // ignore: non_constant_identifier_names
  List<TechnicalIndicator<dynamic, dynamic>> Indicators() {
    // var indicator;
    List<TechnicalIndicator<dynamic, dynamic>> Indicator = [];
    Indicator.clear();

    if (controller.adVisible.value) {
      Indicator.add(
        AccumulationDistributionIndicator<ChartData, DateTime>(
          isVisible: controller.adVisible.value,
          seriesName: 'CandleSeries',
          yAxisName: 'yAxis1',
        ),
      );
    } else if (controller.rsiVisible.value) {
      Indicator.add(
        RsiIndicator<dynamic, dynamic>(
          isVisible: controller.rsiVisible.value,
          period: 3,
          seriesName: 'CandleSeries',
          overbought: 70,
          oversold: 30,
          yAxisName: 'yAxis1',
          signalLineColor: Colors.transparent,
        ),
      );
    } else if (controller.atrVisible.value) {
      Indicator.add(
        AtrIndicator<dynamic, dynamic>(
          isVisible: controller.atrVisible.value,
          period: 3,
          seriesName: 'CandleSeries',
          yAxisName: 'yAxis1',
        ),
      );
    } else if (controller.emaVisible.value) {
      Indicator.add(
        EmaIndicator<dynamic, dynamic>(
          isVisible: controller.emaVisible.value,
          seriesName: 'CandleSeries',
        ),
      );
    } else if (controller.macdVisible.value) {
      Indicator.add(
        MacdIndicator<dynamic, dynamic>(
          isVisible: controller.macdVisible.value,
          longPeriod: 5,
          shortPeriod: 2,
          seriesName: 'CandleSeries',
          yAxisName: 'yAxis3',
        ),
      );
    } else if (controller.smaVisible.value) {
      Indicator.add(
        SmaIndicator<dynamic, dynamic>(
          isVisible: controller.smaVisible.value,
          seriesName: 'CandleSeries',
          yAxisName: 'yAxis2',
          valueField: 'close',
        ),
      );
    } else if (controller.stochasticVisible.value) {
      Indicator.add(
        StochasticIndicator<dynamic, dynamic>(
          isVisible: controller.stochasticVisible.value,
          seriesName: 'CandleSeries',
          yAxisName: 'yAxis4',
          kPeriod: 2,
          dPeriod: 3,
        ),
      );
    } else if (controller.tmaVisible.value) {
      Indicator.add(
        TmaIndicator<ChartData, dynamic>(
          isVisible: controller.tmaVisible.value,
          seriesName: 'CandleSeries',
          yAxisName: 'yAxis2',
          valueField: 'low',
        ),
      );
    } else {
      Indicator.clear();
    }

    return Indicator;
  }

  final controller = Get.put(NSEController());

  DateTime endDate = DateTime.now();
  DateTime startDate = DateTime(2024,04,26);

  // TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: endDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != endDate) {
      setState(() {
        endDate = pickedDate;
        fetchData();
      });
    }
  }

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: startDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != startDate) {
      setState(() {
        startDate = pickedDate;
        fetchData();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String selectedItem = 'SIMPLE';
    return Scaffold(
      appBar: CAppBar(
        title: Text(
          widget.stockName,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => _selectStartDate(context),
                  child: Text('Select start Date'),
                ),
                ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: Text('Select end Date'),
                ),
                DropdownButton<String>(
                  value: interval,
                  onChanged: (newValue) {
                    setState(() {
                      interval = newValue!;
                      fetchData();
                    });
                  },
                  items: <String>['1minute', '30minute','day','week', 'month']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              
              ],
            ),
            
            SizedBox(
              height: KSizeScreen.getScreenHeight(context) * .78,
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
                  indicators: Indicators(),
        
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
    );
  }
}
