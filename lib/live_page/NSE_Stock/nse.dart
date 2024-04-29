import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:csv/csv.dart';
import 'package:trading_app/common/custom_app_bar/custom_appbar.dart';
import 'package:trading_app/live_page/NSE_Stock/NSE_chart/chart_modal/chat_modal.dart';
import 'package:trading_app/live_page/NSE_Stock/NSE_chart/sock_chart.dart';
import 'package:trading_app/live_page/widget/dropdown_btn.dart';

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
        final date = DateTime.parse(row[0]);
        final open = double.parse(row[1].toString());
        final high = double.parse(row[2].toString());
        final low = double.parse(row[3].toString());
        final close = double.parse(row[4].toString());

        _chartData.add(ChartData(date, open, high, low, close));
        setState(() {});
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
              StockChart(
                zoomPanBehavior: _zoomPanBehavior,
                chartData: _chartData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
