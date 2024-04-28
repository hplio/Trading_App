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

  String _selectedItem = 'NONE';

  // List of items for the dropdown
  List<String> _dropdownItems = [
    'NONE',
    'AD',
    'RSI',
    'ATR',
    'EMA',
    'MACD',
    'SMA',
    'Stochastic',
    'TMA'
  ];

  // ignore: non_constant_identifier_names
  bool RsiVisible = false;
  bool AdVisible = false;
  bool AtrVisible = false;
  bool SmaVisible = false;
  bool EmaVisible = false;
  bool MacdVisible = false;
  bool StochasticVisible = false;
  bool TmaVisible = false;

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
              DropdownButton<String>(
                // Value currently selected in the dropdown
                value: _selectedItem,
                // Dropdown items
                items: _dropdownItems.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                // Dropdown onChanged callback
                onChanged: (String? newValue) {
                  setState(() {
                    EmaVisible = false;
                    AtrVisible = false;
                    RsiVisible = false;
                    AdVisible = false;
                    MacdVisible = false;
                    StochasticVisible = false;
                    TmaVisible = false;
                    SmaVisible = false;

                    // Switch statement
                    switch (newValue) {
                      case 'AD':
                        AdVisible = true;
                        _selectedItem = newValue!;
                        break;
                      case 'RSI':
                        RsiVisible = true;
                        _selectedItem = newValue!;
                        break;
                      case 'ATR':
                        AtrVisible = true;
                        _selectedItem = newValue!;
                        break;
                      case 'EMA':
                        EmaVisible = true;
                        _selectedItem = newValue!;
                        break;
                      case 'MACD':
                        MacdVisible = true;
                        _selectedItem = newValue!;
                        break;
                      case 'SMA':
                        SmaVisible = true;
                        _selectedItem = newValue!;
                        break;
                      case 'Stochastic':
                        StochasticVisible = true;
                        _selectedItem = newValue!;
                        break;
                      case 'TMA':
                        TmaVisible = true;
                        _selectedItem = newValue!;
                        break;
                      default:
                        EmaVisible = false;
                        AtrVisible = false;
                        RsiVisible = false;
                        AdVisible = false;
                        MacdVisible = false;
                        StochasticVisible = false;
                        TmaVisible = false;
                        SmaVisible = false;
                        _selectedItem = 'Unknown Option';
                    }

                    // if (newValue == 'RSI') {
                    //   RsiVisible = true;
                    //   AdVisible = false;
                    //   AtrVisible = false;
                    // } else if (newValue == 'AD') {
                    //   AdVisible = true;
                    //   RsiVisible = false;
                    //   AtrVisible = false;
                    // } else if (newValue == 'ATR') {
                    //   AtrVisible = true;
                    //   RsiVisible = false;
                    //   AdVisible = false;
                    // } else if (newValue == 'EMA') {
                    //   EmaVisible = true;
                    //   AtrVisible = false;
                    //   RsiVisible = false;
                    //   AdVisible = false;
                    // } else if (newValue == 'SMA') {
                    //   SmaVisible = true;
                    //   EmaVisible = false;
                    //   AtrVisible = false;
                    //   RsiVisible = false;
                    //   AdVisible = false;
                    // } else if (newValue == 'MACD') {
                    //   EmaVisible = true;
                    //   AtrVisible = false;
                    //   RsiVisible = false;
                    //   AdVisible = false;
                    //   MacdVisible = true;
                    // } else {
                    //   RsiVisible = false;
                    //   AtrVisible = false;
                    //   AdVisible = false;
                    //   // AdiVisible=false;
                    // }
                    _selectedItem = newValue!;
                  });
                },
                // Optional hint text displayed as placeholder
                hint: Text('Select an item'),
              ),
              SfCartesianChart(
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
                  AccumulationDistributionIndicator<ChartData, DateTime>(
                    // name: 'CandleSeries',
                    isVisible: AdVisible,
                    seriesName: 'CandleSeries',
                    yAxisName: 'yAxis1',
                  ),
                  RsiIndicator<dynamic, dynamic>(
                      isVisible: RsiVisible,
                      period: 3,
                      seriesName: 'CandleSeries',
                      overbought: 70,
                      oversold: 30,
                      yAxisName: 'yAxis1',
                      signalLineColor: Colors.transparent),
                  AtrIndicator<dynamic, dynamic>(
                    isVisible: AtrVisible,
                    period: 3,
                    seriesName: 'CandleSeries',
                    yAxisName: 'yAxis1',
                  ),
                  // BollingerBandIndicator<dynamic, dynamic>(
                  //   isVisible: true,
                  //   period: 3,
                  //   seriesName: 'CandleSeries',
                  //   // yAxisName: 'yAxis1',
                  // ),
                  EmaIndicator<dynamic, dynamic>(
                    isVisible: EmaVisible,
                    seriesName: 'CandleSeries',
                    // yAxisName: 'yAxis1',
                    // valueField: 'high',
                  ),
                  MacdIndicator<dynamic, dynamic>(
                    isVisible: MacdVisible,
                    longPeriod: 5,
                    shortPeriod: 2,
                    seriesName: 'CandleSeries',
                    yAxisName: 'yAxis3',
                  ),
                  // MomentumIndicator<dynamic, dynamic>(
                  //   isVisible: true,
                  //   period: 3,
                  //   seriesName: 'CandleSeries',
                  //   yAxisName: 'yAxis3',
                  // ),
                  SmaIndicator<dynamic, dynamic>(
                      isVisible: SmaVisible,
                      seriesName: 'CandleSeries',
                      yAxisName: 'yAxis2',
                      valueField: 'close'),
                  StochasticIndicator<dynamic, dynamic>(
                      isVisible: StochasticVisible,
                      seriesName: 'CandleSeries',
                      yAxisName: 'yAxis4',
                      kPeriod: 2,
                      dPeriod: 3),
                  TmaIndicator<ChartData, dynamic>(
                      isVisible: TmaVisible,
                      seriesName: 'CandleSeries',
                      yAxisName: 'yAxis2',
                      valueField: 'low')
                ],
                tooltipBehavior: TooltipBehavior(enable: true),

                series: <CartesianSeries>[
                  CandleSeries<ChartData, DateTime>(
                    enableTooltip: true,
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

                    name: 'CandleSeries',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
