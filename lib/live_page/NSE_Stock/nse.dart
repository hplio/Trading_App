import 'dart:convert';
import 'dart:isolate';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:trading_app/common/custom_app_bar/custom_appbar.dart';
import 'package:trading_app/live_page/NSE_Stock/NSE_chart/chart_modal/chat_modal.dart';
import 'package:trading_app/live_page/NSE_Stock/NSE_chart/sock_chart.dart';
import 'package:trading_app/live_page/controller/nse_controller.dart';
import 'package:trading_app/live_page/widget/dropdown_btn.dart';
import 'package:http/http.dart' as http;


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

  @override
  void initState() {
    stock = widget.stock;
    _zoomPanBehavior = ZoomPanBehavior(
      enablePinching: true,
      enableDoubleTapZooming: true,
      zoomMode: ZoomMode.x,
      enablePanning: true,
    );
    fetchData();
    super.initState();
  }

  var interval = 'day';
  var stock = '';
  Future<void> fetchData() async {
    _chartData.clear();
    String url =
        "https://api.upstox.com/v2/historical-candle/$stock/$interval/${endDate.year}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}/${startDate.year}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // Request successful, process response here
        final responseData =
            await Isolate.run(() => json.decode(response.body));

        final authToken = responseData[
            'data']; // Assuming the token key in the response JSON is 'token'
        final candle = authToken['candles'];

        for (var row in candle) {
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

      } else {
        // Request failed
      }
    } catch (e) {
      // Error during request
      throw 'Something went wrong. please try again later.';
    }
  }


  final controller = Get.put(NSEController());

  DateTime endDate = DateTime.now();
  DateTime startDate = DateTime(2024, 01, 01);


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
      body: Column(
        mainAxisSize: MainAxisSize.max,
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: OutlinedButton(
                  onPressed: () => _selectStartDate(context),
                  child: const Text('Start Date'),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: OutlinedButton(
                  onPressed: () => _selectDate(context),
                  child: const Text('End Date'),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              DropdownButton<String>(
                value: interval,
                onChanged: (newValue) {
                  setState(() {
                    interval = newValue!;
                    fetchData();
                  });
                },
                items: <String>['1minute', '30minute', 'day', 'week', 'month']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
          StockChart(
            chartData: _chartData,
            zoomPanBehavior: _zoomPanBehavior,
          ),
        ],
      ),
    );
  }
}
